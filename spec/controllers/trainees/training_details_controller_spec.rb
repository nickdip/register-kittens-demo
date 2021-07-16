# frozen_string_literal: true

require "rails_helper"

describe Trainees::TrainingDetailsController do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "#update" do
    context "with an apply draft trainee" do
      let(:trainee) { create(:trainee, :draft, :with_apply_application, provider: user.provider) }

      before do
        allow(TrainingDetailsForm).to receive(:new).and_return(double(save: true))
        allow(controller).to receive(:page_tracker).and_return(double(last_origin_page_path: "/trainees/#{trainee.slug}/relevant-redirect", save!: nil))
        allow(controller).to receive(:trainee_params).and_return(nil)
      end

      it "redirects to /relevant-redirect after update" do
        expect(put(:update, params: { trainee_id: trainee.slug })).to redirect_to("/trainees/#{trainee.slug}/relevant-redirect")
      end
    end
  end
end
