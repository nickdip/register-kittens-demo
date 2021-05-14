# frozen_string_literal: true

module ReviewDraft
  module ApplyDraft
    class View < GovukComponent::Base
      include TraineeHelper
      include TaskListHelper

      attr_reader :trainee

      def initialize(trainee:)
        @trainee = trainee
      end
    end
  end
end
