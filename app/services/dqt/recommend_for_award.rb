# frozen_string_literal: true

module Dqt
  class RecommendForAward
    include ServicePattern

    class TraineeAwardMissingTrn < StandardError; end

    def initialize(trainee:)
      @trainee = trainee
    end

    def call
      return unless FeatureService.enabled?(:integrate_with_dqt)

      raise(TraineeAwardMissingTrn, "Cannot recommend for award without a trn (id: #{trainee.id})") if trainee.trn.blank?

      response["qtsDate"]
    end

  private

    attr_reader :trainee

    def response
      @response ||= Client.put(path, body: params.to_json)
    end

    def path
      @path ||= "/v2/teachers/#{trainee.trn}/itt-outcome?slugId=#{trainee.slug}&birthDate=#{trainee.date_of_birth.iso8601}"
    end

    def params
      @params ||= Params::Award.new(trainee:)
    end
  end
end
