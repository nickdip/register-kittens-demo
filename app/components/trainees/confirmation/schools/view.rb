# frozen_string_literal: true

module Trainees
  module Confirmation
    module Schools
      class View < GovukComponent::Base
        include SummaryHelper

        attr_accessor :data_model

        def initialize(data_model:)
          @data_model = data_model
          @not_provided_copy = I18n.t("components.confirmation.not_provided")
        end

        def trainee
          data_model.is_a?(Trainee) ? data_model : data_model.trainee
        end

        def summary_title
          t(".summary_title")
        end

        def lead_school_name
          return @not_provided_copy if lead_school&.name.blank?

          lead_school.name
        end

        def lead_school_location
          return @not_provided_copy if lead_school&.urn.blank?

          ["URN #{lead_school.urn}", lead_school.town, lead_school.postcode].select(&:present?).join(", ")
        end

        def lead_school_partial
          tag.p(lead_school_name, class: "govuk-body") +
            tag.span(lead_school_location, class: "govuk-hint")
        end

        def lead_school
          @lead_school ||= School.where(id: data_model.lead_school_id).first
        end

        def edit_lead_school_path
          edit_trainee_lead_schools_path(trainee)
        end

        def employing_school_name
          return @not_provided_copy if employing_school&.name.blank?

          employing_school.name
        end

        def employing_school_location
          return @not_provided_copy if employing_school&.urn.blank?

          ["URN #{employing_school.urn}", employing_school.town, employing_school.postcode].select(&:present?).join(", ")
        end

        def employing_school_partial
          tag.p(employing_school_name, class: "govuk-body") +
            tag.span(employing_school_location, class: "govuk-hint")
        end

        def employing_school
          @employing_school ||= School.where(id: data_model.employing_school_id).first
        end

        def edit_employing_school_path
          edit_trainee_employing_schools_path(trainee)
        end

        def summary_rows
          rows = [
            {
              key: t(".lead_school"),
              value: lead_school_partial,
              action: govuk_link_to(t("change"), edit_lead_school_path),
            },
          ]

          if trainee.requires_employing_school?
            rows << {
              key: t(".employing_school"),
              value: employing_school_partial,
              action: govuk_link_to(t("change"), edit_employing_school_path),
            }
          end

          rows
        end
      end
    end
  end
end
