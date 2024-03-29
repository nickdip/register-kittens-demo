# frozen_string_literal: true

class BackfillHesaTrnSubmissions < ActiveRecord::Migration[6.1]
  def up
    ::Hesa::TrnSubmission.where.not(payload: nil).find_each do |submission|
      trns = CSV.new(submission.payload, headers: true).pluck("TRN")
      next if trns.empty?

      ::Trainee.where(trn: trns).update_all(hesa_trn_submission_id: submission.id)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
