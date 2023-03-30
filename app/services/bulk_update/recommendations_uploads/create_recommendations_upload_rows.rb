# frozen_string_literal: true

module BulkUpdate
  module RecommendationsUploads
    # creates recommendations_upload_rows from a CSV
    # validates each row and trainee to create recommendations_upload_row.row_errors
    class CreateRecommendationsUploadRows
      include ServicePattern

      FIRST_CSV_ROW_NUMBER = 2

      def initialize(recommendations_upload:, csv:)
        @recommendations_upload = recommendations_upload
        @csv = csv
      end

      def call
        csv.map.with_index do |row, index|
          next if row.any? { |cell| cell.include?(Reports::BulkRecommendReport::DO_NOT_EDIT) }

          row = Row.new(row)
          # validate row and (matched) trainee
          trainee_validator = ValidateTrainee.new(row: row, provider: recommendations_upload.provider)
          csv_row_validator = ValidateCsvRow.new(csv: csv, row: row, trainee: trainee_validator.trainee)

          # create the recommendations_upload_row and associate it with the matched trainee (if any)
          upload_row = create_recommendations_upload_row!(trainee_validator.trainee, row, index + FIRST_CSV_ROW_NUMBER)

          # create any validation errors and associate them with the recommendations_upload_row just created
          create_validation_errors!(upload_row, csv_row_validator.messages) unless csv_row_validator.valid?
          create_validation_errors!(upload_row, trainee_validator.messages) unless trainee_validator.valid?
        end
      end

    private

      attr_reader :recommendations_upload, :csv

      def create_recommendations_upload_row!(trainee, row, row_number)
        recommendations_upload.rows.create(
          matched_trainee_id: trainee&.id,
          csv_row_number: row_number,
          standards_met_at: row.standards_met_at&.to_date,
          trn: row.trn,
          hesa_id: row.hesa_id,
          age_range: row.age_range,
          first_names: row.first_names,
          last_names: row.last_names,
          lead_school: row.lead_school,
          phase: row.phase,
          qts_or_eyts: row.qts_or_eyts,
          route: row.route,
          subject: row.subject,
          provider_trainee_id: row.provider_trainee_id,
        )
      end

      def create_validation_errors!(upload_row, messages)
        messages.each do |message|
          upload_row.row_errors.create(message:)
        end
      end
    end
  end
end
