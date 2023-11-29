# frozen_string_literal: true

class DestroyPlacementForm
  attr_accessor :trainee, :placement

  def initialize(placements_form:, placement:)
    @placements_form = placements_form
    @trainee = placements_form.trainee
    @placement = placement
  end

  def self.find_from_param(placements_form:, slug:)
    placement = placements_form.trainee.placements.find_by!(slug:)
    new(placements_form:, placement:)
  end

  def destroy_or_stash!
    if trainee.draft?
      @placements_form.destroy!(@placement.slug)
    else
      @placements_form.mark_for_destruction!(@placement.slug)
    end
  end
end
