# frozen_string_literal: true

class SchoolSearch
  class Result
    attr_reader :schools, :limit, :total_count

    def initialize(schools:, limit:, total_count:)
      @schools = schools
      @limit = limit
      @total_count = total_count
    end
  end

  include ServicePattern

  MIN_QUERY_LENGTH = 2
  DEFAULT_LIMIT = 15

  def initialize(query: nil, limit: DEFAULT_LIMIT, lead_schools_only: false)
    @query = ReplaceAbbreviation.call(string: StripPunctuation.call(string: query))
    @limit = limit
    @lead_schools_only = lead_schools_only
  end

  def call
    Result.new(schools: specified_schools, limit: limit, total_count: total_count)
  end

  def all_schools
    schools = School.open
    schools = schools.search(query) if query
    schools = schools.lead_only if lead_schools_only
    schools.reorder(:name)
  end

  def specified_schools
    schools = all_schools
    schools.limit(limit) if limit
  end

  def total_count
    all_schools.count
  end

private

  attr_reader :query, :limit, :lead_schools_only
end
