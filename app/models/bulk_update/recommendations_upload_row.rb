# frozen_string_literal: true

# == Schema Information
#
# Table name: bulk_update_recommendations_upload_rows
#
#  id                                    :bigint           not null, primary key
#  csv_row_number                        :integer
#  standards_met_at                      :date
#  trn                                   :string
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  bulk_update_recommendations_upload_id :bigint           not null
#  hesa_id                               :string
#
# Indexes
#
#  idx_bu_ru_rows_on_bu_recommendations_upload_id  (bulk_update_recommendations_upload_id)
#
# Foreign Keys
#
#  fk_rails_...  (bulk_update_recommendations_upload_id => bulk_update_recommendations_uploads.id)
#
class BulkUpdate::RecommendationsUploadRow < ApplicationRecord
  belongs_to :recommendations_upload,
             class_name: "BulkUpdate::RecommendationsUpload",
             foreign_key: :bulk_update_recommendations_upload_id,
             inverse_of: :recommendations_upload_rows

  has_one :trainee, foreign_key: :trn, primary_key: :trn, inverse_of: false

  has_many :row_errors, as: :errored_on, class_name: "BulkUpdate::RowError"

  def row_error_messages
    row_errors.map(&:message).join("\n")
  end
end
