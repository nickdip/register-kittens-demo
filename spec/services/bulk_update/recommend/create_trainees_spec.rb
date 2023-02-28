# frozen_string_literal: true

require "rails_helper"

module BulkUpdate
  module Recommend
    describe CreateTrainees do
      subject(:service) { described_class.call(recommendations_upload_id: recommendations_upload.id, csv: csv) }

      let(:csv) { CSV.new(file.read, headers: true).read }
      let(:recommendations_upload) { create(:bulk_update_recommendations_upload) }
      let(:provider) { recommendations_upload.provider }

      before { service }

      describe "#call" do
        context "given a valid CSV" do
          let(:file) { file_fixture("bulk_update/recommendations_upload/complete.csv") }

          it "creates the trainee records" do
            expect(provider.recommended_trainees.pluck(:trn, :csv_row_number, :standards_met_at)).to eql(
              [
                ["2413295", 3, "20-07-2022".to_date],
                ["4814731", 4, "21-07-2022".to_date],
              ],
            )
          end
        end
      end
    end
  end
end
