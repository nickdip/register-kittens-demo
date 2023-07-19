# frozen_string_literal: true

require "rails_helper"

module Trainees
  describe SetSlugSentAt do
    let(:trainee) { create(:trainee) }

    around do |example|
      Timecop.freeze { example.run }
    end

    context "when the `slug_sent_to_dqt_at` has not previously been set" do
      it "sets the `slug_sent_to_dqt_at` attribute to the current datetime" do
        described_class.call(trainee:)
        expect(trainee.slug_sent_to_dqt_at).to eq(Time.zone.now)
      end
    end

    context "when the `slug_sent_to_dqt_at` has previously been set" do
      let(:trainee) { create(:trainee, slug_sent_to_dqt_at: 1.day.ago) }

      it "does not update the `slug_sent_to_dqt_at` attribute" do
        described_class.call(trainee:)
        expect(trainee.slug_sent_to_dqt_at).to eq(1.day.ago)
      end
    end
  end
end
