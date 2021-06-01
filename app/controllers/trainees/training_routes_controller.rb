# frozen_string_literal: true

module Trainees
  class TrainingRoutesController < ApplicationController
    before_action :ensure_trainee_is_draft!
    before_action :authorize_trainee

    def edit; end

    def update
      return redirect_url if route_not_changed?

      ActiveRecord::Base.transaction do
        trainee.update!(trainee_params)
        trainee.clear_course_details_attributes
      end

      redirect_url
    end

  private

    def redirect_url
      redirect_to page_tracker.last_origin_page_path || trainee_path(trainee)
    end

    def trainee_params
      params.require(:trainee).permit(:training_route)
    end

    def trainee
      @trainee ||= Trainee.from_param(params[:trainee_id])
    end

    def authorize_trainee
      authorize(trainee)
    end

    def route_not_changed?
      trainee.training_route == trainee_params["training_route"]
    end
  end
end
