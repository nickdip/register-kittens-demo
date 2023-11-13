# frozen_string_literal: true

module Trainees
  class PlacementsController < BaseController
    before_action { require_feature_flag(:trainee_placement) }

    def new
      @placement_form = PlacementForm.new(
        placements_form: placements_form,
        placement: Placement.new,
      )
    end

    def edit; end

    def create
      @placement_form = PlacementForm.new(
        placements_form: placements_form,
        placement: Placement.new(placement_params),
      )

      if @placement_form.save_or_stash
        redirect_to(trainee_placements_confirm_path(trainee_id: @trainee.slug))
      else
        render(:new)
      end
    end

    def delete
      @placements_form = PlacementsForm.new(@trainee)
      @placement_form = DestroyPlacementForm.find_from_param(
        placements_form: @placements_form,
        slug: params[:id],
      )
    end

    def destroy
      @placement_form = DestroyPlacementForm.find_from_param(
        placements_form: PlacementsForm.new(@trainee),
        slug: params[:id],
      )
      @placement_form.mark_for_destruction!

      redirect_to(trainee_placements_confirm_path(trainee_id: @trainee.slug))
    end

  private

    def placements_form
      @placements_form ||= PlacementsForm.new(trainee)
    end

    def placement_params
      params.fetch(:placement, {}).permit(:school_id, :urn, :name, :address, :postcode)
    end
  end
end
