# frozen_string_literal: true

module YearChangeBanner
  class View < GovukComponent::Base
    def initialize
      super(classes: "", html_attributes: "")
    end

    def render?
      Time.zone.today.month == 7 || Time.zone.today.month == 8
    end

    def title
      if Time.zone.today.month == 7
        "The #{current_year} to #{current_year + 1} academic year will start on 1 August"
      elsif Time.zone.today.month == 8
        "The #{current_year} to #{current_year + 1} academic year started on 1 August"
      end
    end

    def content
      if Time.zone.today.month == 7
        "<a class=\"govuk-notification-banner__link\" href=\"#{dates_and_deadlines_guidance_path}\">View dates and deadlines</a> for the upcoming academic year.".html_safe
      elsif Time.zone.today.month == 8
        "<a class=\"govuk-notification-banner__link\" href=\"#{dates_and_deadlines_guidance_path}\">View dates and deadlines</a> for this academic year.".html_safe
      end
    end

  private

    def current_month
      Time.zone.today.month
    end

    def current_year
      Time.zone.today.year
    end
  end
end
