# frozen_string_literal: true

module SummaryHelper
  def date_for_summary_view(date)
    return if date&.day.blank? #  works for Struct too

    date.strftime("%-d %B %Y")
  end

  def age_range_for_summary_view(age_range)
    age_range.join(" to ")
  end
end
