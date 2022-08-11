# frozen_string_literal: true

module Trainees
  class CalculateIttEndDate
    include ServicePattern

    DURATIONS = %w[hours months days years].freeze

    delegate :commencement_date,
             :itt_start_date,
             :itt_end_date,
             :hesa_metadatum,
             :training_route, to: :trainee

    def initialize(trainee:, actual: false)
      @trainee = trainee
      @actual = actual
    end

    def call
      return unless start_date

      if course_duration > 5.years
        raise("Trainee id: #{trainee.id}, slug: #{trainee.slug} has a course length greater than five years")
      end

      start_date + course_duration
    end

  private

    attr_reader :trainee, :actual

    def start_date
      commencement_date || itt_start_date
    end

    def course_duration
      return actual_course_duration if actual

      course_duration = actual_course_duration || estimated_course_duration
      # Year long courses end on average 10 months after they start, so the calculation below reflects this reality.
      course_duration_unit == "years" ? course_duration - 2.months : course_duration
    end

    def actual_course_duration
      return unless [course_duration_unit, course_duration_amount].all?(&:present?)

      course_duration_amount.public_send(course_duration_unit)
    end

    def estimated_course_duration
      return 3.years if UNDERGRAD_ROUTES.include?(training_route)
      return 2.years if trainee.part_time?

      1.year
    end

    def course_duration_amount
      hesa_metadatum&.study_length
    end

    def course_duration_unit
      hesa_metadatum&.study_length_unit if DURATIONS.include?(hesa_metadatum&.study_length_unit)
    end
  end
end
