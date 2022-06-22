# frozen_string_literal: true

require "rails_helper"

module Dqt
  module Params
    describe TrnRequest do
      let(:trainee) { create(:trainee, :completed, gender: "female") }
      let(:degree) { trainee.degrees.first }
      let(:degree_subject) { Hesa::CodeSets::DegreeSubjects::MAPPING.invert[degree.subject] }

      describe "#params" do
        subject { described_class.new(trainee: trainee).params }

        let(:uk_address_hash) do
          {

            "addressLine1" => trainee.address_line_one,
            "addressLine2" => trainee.address_line_two,
            "addressLine3" => nil,
            "city" => trainee.town_city,
            "postalCode" => trainee.postcode,
            "country" => described_class::UNITED_KINGDOM,
          }
        end

        it "returns a hash including personal attributes" do
          expect(subject).to include({
            "firstName" => trainee.first_names,
            "middleName" => trainee.middle_names,
            "lastName" => trainee.last_name,
            "birthDate" => trainee.date_of_birth.iso8601,
            "emailAddress" => trainee.email,
            "genderCode" => "Female",
            "address" => uk_address_hash,
          })
        end

        it "returns a hash including course attributes" do
          expect(subject["initialTeacherTraining"]).to eq({
            "providerUkprn" => trainee.provider.ukprn,
            "programmeStartDate" => trainee.itt_start_date.iso8601,
            "programmeEndDate" => trainee.itt_end_date.iso8601,
            "programmeType" => "AssessmentOnlyRoute",
            "subject1" => "100403",
            "subject2" => trainee.course_subject_two,
            "subject3" => trainee.course_subject_three,
            "ageRangeFrom" => trainee.course_min_age,
            "ageRangeTo" => trainee.course_max_age,
          })
        end

        it "returns a hash including degree attributes" do
          expect(subject["qualification"]).to eq({
            "providerUkprn" => nil,
            "countryCode" => "XK",
            "subject" => degree_subject,
            "class" => described_class::DEGREE_CLASSES[degree.grade],
            "date" => Date.new(degree.graduation_year).iso8601,
          })
        end

        context "when gender is gender_not_provided" do
          let(:trainee) { create(:trainee, :completed, gender: "gender_not_provided") }

          it "maps gender to not provided" do
            expect(subject["genderCode"]).to eq("NotProvided")
          end
        end

        context "when trainee has an international address" do
          let(:trainee) { create(:trainee, :completed, :with_non_uk_address) }

          it "maps international address to addressLine1" do
            expect(subject["address"]).to eq({
              "addressLine1" => trainee.international_address,
            })
          end
        end

        context "when trainee has an international degree" do
          let(:non_uk_degree) { build(:degree, :non_uk_degree_with_details, country: "Albania") }
          let(:trainee) { create(:trainee, :completed, degrees: [non_uk_degree]) }

          it "maps the degree country to HESA countryCode" do
            expect(subject["qualification"]).to include({
              "countryCode" => "AL",
            })
          end

          context "country has extra information" do
            let(:non_uk_degree) { build(:degree, :non_uk_degree_with_details, country: "Hong Kong (Special Administrative Region of China)") }
            let(:trainee) { create(:trainee, :completed, degrees: [non_uk_degree]) }

            it "maps the degree country to HESA countryCode" do
              expect(subject["qualification"]).to include({ "countryCode" => "HK" })
            end
          end
        end

        context "when trainee has no degree" do
          let(:trainee) { create(:trainee, :early_years_undergrad) }

          it "doesn't include qualification" do
            expect(subject["qualification"]).to be_nil
          end
        end
      end
    end
  end
end
