# frozen_string_literal: true

class DetermineSignOffPeriod
  VALID_PERIODS = %i[census_period performance_period outside_period].freeze

  def self.call
    return Settings.sign_off_period.to_sym if valid_sign_off_period?

    current_date = Time.zone.today

    return :census_period if census_range.cover?(current_date)
    return :performance_period if performance_range.cover?(current_date)

    :outside_period
  end

  def self.valid_sign_off_period?
    return false if Settings.sign_off_period.blank?
    return true if VALID_PERIODS.include?(Settings.sign_off_period.to_sym)

    Sentry.capture_exception(StandardError.new("Invalid sign_off_period value: #{Settings.sign_off_period}"))
    false
  end

  def self.census_range
    start_date = Date.new(Time.zone.today.year, 9, 1) # 1st September
    end_date = Date.new(Time.zone.today.year, 11, 7) # 7th November

    start_date..end_date
  end

  def self.performance_range
    start_date = Date.new(Time.zone.today.year, 1, 1) # 1st January
    end_date = Date.new(Time.zone.today.year, 1, 31) # 31st January

    start_date..end_date
  end
end
