# frozen_string_literal: true

class ReportsController < BaseTraineeController
  include DateOfTheNthWeekdayHelper

  before_action :set_cycle_variables

  helper_method :itt_new_starter_trainees

  def index
    authorize(current_user, :reports?)
  end

  def itt_new_starter_data_sign_off
    authorize(current_user, :reports?)

    respond_to do |format|
      format.html do
        @sign_off_url = Settings.sign_off_trainee_data_url
        @census_date = census_date(@current_academic_cycle.start_year).strftime("%d %B %Y")
      end

      format.csv do
        authorize(:trainee, :export?)
        headers["X-Accel-Buffering"] = "no"
        headers["Cache-Control"] = "no-cache"
        headers["Content-Type"] = "text/csv; charset=utf-8"
        headers["Content-Disposition"] =
          %(attachment; filename="#{itt_new_starter_filename}")
        headers["Last-Modified"] = Time.zone.now.ctime.to_s

        response.status = 200

        self.response_body = Exports::ReportCsvEnumeratorService.call(itt_new_starter_trainees)
      end
    end
  end

  def performance_profiles
    authorize(current_user, :reports?)

    respond_to do |format|
      format.html do
        @sign_off_date = Date.new(@current_academic_cycle.end_year, 1, 31).strftime("%d %B %Y")
        @sign_off_url = Settings.sign_off_performance_profiles_url
      end

      format.csv do
        authorize(:trainee, :export?)
        headers["X-Accel-Buffering"] = "no"
        headers["Cache-Control"] = "no-cache"
        headers["Content-Type"] = "text/csv; charset=utf-8"
        headers["Content-Disposition"] =
          %(attachment; filename="#{performance_profiles_filename}")
        headers["Last-Modified"] = Time.zone.now.ctime.to_s

        response.status = 200

        self.response_body = Exports::ReportCsvEnumeratorService.call(performance_profiles_trainees)
      end
    end
  end

  def bulk_recommend_export
    authorize(current_user, :bulk_recommend?)

    send_data(
      Exports::BulkRecommendExport.call(bulk_recommend_trainees),
      filename: bulk_recommend_export_filename,
      disposition: :attachment,
    )
  end

  def bulk_recommend_empty_export
    authorize(current_user, :bulk_recommend?)

    send_data(
      Exports::BulkRecommendEmptyExport.call,
      filename: bulk_recommend_empty_export_filename,
      disposition: :attachment,
    )
  end

private

  def itt_new_starter_trainees
    @itt_new_starter_trainees ||= policy_scope(FindNewStarterTrainees.new(census_date(@current_academic_cycle.start_year)).call)
  end

  def performance_profiles_trainees
    Trainees::Filter.call(trainees: base_trainee_scope, filters: { academic_year: [@previous_academic_cycle.start_year] })
  end

  def bulk_recommend_trainees
    policy_scope(FindBulkRecommendTrainees.call).order(last_name: :asc)
  end

  def time_now
    Time.now.in_time_zone("London").strftime("%F_%H-%M-%S")
  end

  def itt_new_starter_filename
    "#{time_now}_New-trainees-#{@current_academic_cycle.label('-')}-sign-off-Register-trainee-teachers_exported_records.csv"
  end

  def performance_profiles_filename
    "#{time_now}_#{@previous_academic_cycle.label('-')}_trainees_performance-profiles-sign-off_register-trainee-teachers.csv"
  end

  def bulk_recommend_export_filename
    "#{current_user.organisation.name.parameterize}-trainees-to-recommend-prepopulated.csv"
  end

  def bulk_recommend_empty_export_filename
    "#{current_user.organisation.name.parameterize}-trainees-to-recommend-empty.csv"
  end

  def census_date(year)
    date_of_nth_weekday(10, year, 3, 2)
  end

  def set_cycle_variables
    @current_academic_cycle = AcademicCycle.current
    @previous_academic_cycle = AcademicCycle.previous
    @current_academic_cycle_label = @current_academic_cycle.label
    @previous_academic_cycle_label = @previous_academic_cycle.label
  end

  def base_trainee_scope
    policy_scope(Trainee.includes({ provider: [:courses] }, :start_academic_cycle, :end_academic_cycle).not_draft)
  end
end
