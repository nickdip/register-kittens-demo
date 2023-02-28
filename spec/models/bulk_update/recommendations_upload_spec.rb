# frozen_string_literal: true

require "rails_helper"

RSpec.describe BulkUpdate::RecommendationsUpload do
  describe "associations" do
    it { is_expected.to have_many(:recommended_trainees) }
    it { is_expected.to belong_to(:provider) }
    it { is_expected.to have_one_attached(:file) }
  end
end
