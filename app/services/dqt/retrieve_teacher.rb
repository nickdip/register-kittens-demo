# frozen_string_literal: true

module Dqt
  class RetrieveTeacher
    include ServicePattern

    def initialize(trainee:)
      @trainee = trainee
    end

    def call
      Client.get("/v2/teachers/#{trainee.trn}?birthdate=#{trainee.date_of_birth}&includeInactive=true")
    end

    attr_reader :trainee
  end
end
