# frozen_string_literal: true

require "rails_helper"

module Trainees
  describe Update do
    let(:trainee) { create(:trainee) }

    describe "#call" do
      context "valid params" do
        let(:params) { { first_names: "Dave", last_name: "Hill" } }

        before do
          allow(Dqt::UpdateTraineeJob).to receive(:perform_later)
        end

        it "updates the trainee" do
          described_class.call(trainee:, params:)
          trainee.reload
          expect(trainee.first_names).to eq("Dave")
          expect(trainee.last_name).to eq("Hill")
        end

        it "queues an update to DQT" do
          expect(Dqt::UpdateTraineeJob).to receive(:perform_later).with(trainee)
          described_class.call(trainee:, params:)
        end

        it "does not queue a withdrawal to DQT when `withdrawal` option is not set" do
          expect(Dqt::WithdrawTraineeJob).not_to receive(:perform_later).with(trainee)
          described_class.call(trainee:, params:)
        end

        it "returns true" do
          expect(described_class.call(trainee:, params:)).to be(true)
        end
      end

      context "passed a trainee that has had attributes set" do
        context "with no params" do
          it "persists any changes" do
            trainee.first_names = "Baldric"
            described_class.call(trainee:)
            trainee.reload
            expect(trainee.first_names).to eq("Baldric")
          end
        end

        context "with params" do
          it "persists any changes with the params" do
            trainee.first_names = "Baldric"
            described_class.call(trainee: trainee, params: { last_name: "Bladder" })
            trainee.reload
            expect(trainee.first_names).to eq("Baldric")
            expect(trainee.last_name).to eq("Bladder")
          end
        end
      end
    end
  end
end
