# frozen_string_literal: true

require "rails_helper"

module Submissions
  describe MissingDataValidator, type: :model do
    describe "validations" do
      subject { described_class.new(trainee:) }

      context "when all sections are valid" do
        let(:trainee) { build(:trainee, :submitted_with_start_date) }

        it "is valid" do
          expect(subject.valid?).to be true
          expect(subject.errors).to be_empty
        end
      end

      context "when a section is invalid" do
        let(:trainee) { build(:trainee, :submitted_with_start_date, first_names: nil) }

        it "is invalid and returns an error message" do
          expect(subject.valid?).to be false
          expect(subject.errors.messages[:trainee])
            .to include(I18n.t("activemodel.errors.models.submissions/missing_data_validator.attributes.trainee.incomplete"))
        end
      end

      context "when only the placements section is missing data", feature_trainee_placement: true do
        let(:trainee) { build(:trainee, :submitted_with_start_date, :early_years_salaried) }

        before do
          trainee.placement_detail = nil
        end

        it "is valid" do
          expect(subject.valid?).to be true
          expect(subject.errors).to be_empty
        end
      end
    end

    describe "#missing_fields" do
      subject { described_class.new(trainee:) }

      context "when trainee has no missing data" do
        let(:trainee) { build(:trainee, :submitted_with_start_date) }

        it "returns an empty array" do
          expect(subject.missing_fields).to be_empty
        end
      end

      context "when trainee has missing data" do
        let(:trainee) { build(:trainee, :submitted_with_start_date, first_names: nil) }

        it "returns the correct attributes from the invalid form" do
          expect(subject.missing_fields).to contain_exactly(:first_names)
        end
      end

      context "when trainee start date is missing" do
        context "and the course has not started" do
          let(:trainee) { build(:trainee, :submitted_for_trn, :itt_start_date_in_the_future, trainee_start_date: nil) }

          it "returns an empty array" do
            expect(subject.missing_fields).to be_empty
          end
        end

        context "and the course has already started" do
          let(:trainee) { build(:trainee, :submitted_for_trn, :itt_start_date_in_the_past, trainee_start_date: nil) }

          it "returns the correct attributes from the invalid form" do
            expect(subject.missing_fields).to contain_exactly(:trainee_start_date)
          end
        end
      end

      context "HESA trainee with degree having missing fields" do
        let(:trainee) { create(:trainee, :submitted_with_start_date, :imported_from_hesa) }

        before { Degree.create(trainee: trainee, locale_code: :uk) }

        it "doesn't cause validation errors" do
          expect(subject.valid?).to be(true)
        end
      end

      context "Trainee with missing placements", feature_trainee_placement: true do
        let(:trainee) { create(:trainee, :submitted_with_start_date, :provider_led_postgrad) }

        it "doesn't cause validation errors" do
          expect(subject.valid?).to be(true)
        end
      end

      context "non draft trainee", feature_trainee_placement: true do
        let(:trainee) { Trainee.new(state: :submitted_for_trn) }

        it "cause validation errors" do
          expect(subject.valid?).to be(false)
        end

        it "returns all the missing fields" do
          expect(subject.missing_fields).to contain_exactly(:first_names,
                                                            :last_name,
                                                            :date_of_birth,
                                                            :sex,
                                                            :nationality_names,
                                                            :email,
                                                            :diversity_disclosure,
                                                            :course_subject_one,
                                                            :main_age_range,
                                                            :study_mode,
                                                            :itt_start_date,
                                                            :itt_end_date,
                                                            :trainee_id,
                                                            :training_initiative,
                                                            :placement_detail,
                                                            :trainee_start_date)
        end
      end
    end
  end
end
