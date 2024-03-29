# frozen_string_literal: true

require "csv"

# Service to export data
module Exports
  class ExportTraineesService < ExportServiceBase
    def initialize(trainees)
      @report_class = Reports::TraineesReport
      @scope = trainees
    end
  end
end
