# frozen_string_literal: true

module Trainees
  module Funding
    class BursariesController < ApplicationController
      before_action :authorize_trainee

      def edit
        load_bursary_info!
        @bursary_form = ::Funding::BursaryForm.new(trainee)
      end

      def update
        @bursary_form = ::Funding::BursaryForm.new(trainee, params: bursary_params)

        save_strategy = trainee.draft? ? :save! : :stash

        if @bursary_form.public_send(save_strategy)
          redirect_to(trainee_funding_confirm_path)
        else
          load_bursary_info!
          render :edit
        end
      end

    private

      def trainee
        @trainee ||= Trainee.from_param(params[:trainee_id])
      end

      def bursary_params
        return { applying_for_bursary: nil } if params[:funding_bursary_form].blank?

        params.require(:funding_bursary_form).permit(:applying_for_bursary).transform_values do |v|
          ActiveModel::Type::Boolean.new.cast(v)
        end
      end

      def authorize_trainee
        authorize(trainee)
      end

      def load_bursary_info!
        @subject = @trainee.course_subject_one
        @amount = CalculateBursary.for_route_and_subject(@trainee.training_route.to_sym, @subject)
      end
    end
  end
end
