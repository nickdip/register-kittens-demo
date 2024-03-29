# frozen_string_literal: true

require "rails_helper"

module Dttp
  describe PlacementAssignment do
    subject { build(:dttp_placement_assignment) }

    it { is_expected.to be_valid }

    describe "relationships" do
      it { is_expected.to have_one(:dormant_period) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:response) }
    end
  end
end
