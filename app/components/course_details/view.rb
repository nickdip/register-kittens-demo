# frozen_string_literal: true

module CourseDetails
  class View < GovukComponent::Base
    include SummaryHelper
    include CourseDetailsHelper
    include TraineeHelper

    def initialize(data_model:, has_errors: false)
      @data_model = data_model
      @has_errors = has_errors
      @not_provided_copy = t("components.confirmation.not_provided")
    end

    def trainee
      data_model.is_a?(Trainee) ? data_model : data_model.trainee
    end

    def summary_title
      t("components.course_detail.title")
    end

    def rows
      [
        type_of_course,
        subject_row,
        age_range_row,
        study_mode_row,
        course_date_row(course_start_date, :start),
        course_date_row(course_end_date, :end),
      ].compact.tap do |collection|
        if show_publish_courses?(trainee)
          collection.unshift({
            key: t("components.course_detail.course_details"),
            value: course_details,
            action: action_link("course details", path: edit_trainee_publish_course_details_path(trainee)),
          })
        end
      end
    end

  private

    attr_accessor :data_model, :has_errors

    def type_of_course
      if require_course_type?
        { key: t("components.course_detail.type_of_course"), value: course_type }
      end
    end

    def subject_row
      if require_subject?
        mappable_field(subject, t("components.course_detail.subject"))
      end
    end

    def age_range_row
      if require_age_range?
        mappable_field(course_age_range, t("components.course_detail.age_range"))
      end
    end

    def study_mode_row
      if trainee.requires_study_mode?
        mappable_field(study_mode, t("components.course_detail.study_mode"))
      end
    end

    def course_date_row(value, context)
      mappable_field(value, t("components.course_detail.#{itt_route? ? 'itt' : 'course'}_#{context}_date"))
    end

    def itt_route?
      trainee.itt_route?
    end

    def require_subject?
      !trainee.early_years_route?
    end

    def require_age_range?
      !trainee.early_years_route?
    end

    def require_course_type?
      return true unless trainee.early_years_route?

      !trainee.draft?
    end

    def action_link(text, path: edit_trainee_course_details_path(trainee))
      govuk_link_to("#{t(:change)}<span class='govuk-visually-hidden'> #{text}</span>".html_safe, path)
    end

    def course_details
      return t("components.course_detail.details_not_on_publish") if data_model.course_code.blank?

      "#{course.name} (#{course.code})"
    end

    def subject
      if data_model.course_subject_one.present?
        subjects_for_summary_view(data_model.course_subject_one,
                                  data_model.course_subject_two,
                                  data_model.course_subject_three)
      end
    end

    def course_age_range
      age_range_for_summary_view(data_model.course_age_range) if data_model.course_age_range.present?
    end

    def study_mode
      t("components.course_detail.study_mode_values.#{trainee.study_mode}") if trainee.study_mode.present?
    end

    def course_type
      return @not_provided_copy if trainee.training_route.blank?

      t("activerecord.attributes.trainee.training_routes.#{trainee.training_route}")
    end

    def course_start_date
      date_for_summary_view(data_model.course_start_date) if data_model.course_start_date.present?
    end

    def course_end_date
      date_for_summary_view(data_model.course_end_date) if data_model.course_end_date.present?
    end

    def course
      @course ||= Course.find_by(code: data_model.course_code)
    end

    def mappable_field(field_value, field_label)
      MappableFieldRow.new(
        field_value: field_value,
        field_label: field_label,
        text: t("components.confirmation.missing"),
        action_url: edit_trainee_course_details_path(trainee),
        has_errors: has_errors,
      ).to_h
    end
  end
end
