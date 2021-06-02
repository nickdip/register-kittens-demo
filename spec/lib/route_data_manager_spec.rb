# frozen_string_literal: true

require "rails_helper"

describe RouteDataManager do
  subject { described_class.new(trainee: trainee) }

  describe "#update_training_route" do
    context "when a trainee has course details" do
      let(:trainee) { create(:trainee, :assessment_only, :with_course_details) }

      it "wipes the course details and changes route" do
        expect { subject.update_training_route!("provider_led_postgrad") }
          .to change { trainee.progress.course_details }
          .from(trainee.progress.course_details).to(false)
          .and change { trainee.course_code }
          .from(trainee.course_code).to(nil)
          .and change { trainee.subject }
          .from(trainee.subject).to(nil)
          .and change { trainee.course_age_range }
          .from(trainee.course_age_range).to([])
          .and change { trainee.course_start_date }
          .from(trainee.course_start_date).to(nil)
          .and change { trainee.course_end_date }
          .from(trainee.course_end_date).to(nil)
          .and change { trainee.training_route }
          .from(trainee.training_route).to("provider_led_postgrad")
      end
    end
  end
end
