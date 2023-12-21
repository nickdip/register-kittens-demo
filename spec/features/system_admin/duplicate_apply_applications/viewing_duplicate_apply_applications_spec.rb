# frozen_string_literal: true

require "rails_helper"

feature "Viewing duplicate apply applications" do
  let(:user) { create(:user, system_admin: true) }
  let(:lead_school) { create(:school, lead_school: true) }

  scenario "shows the duplicate apply applications" do
    given_i_am_authenticated(user:)
    and_there_are_duplicate_apply_applications
    when_i_visit_the_duplicate_apply_applications_index_page
    then_i_should_see_the_duplicate_apply_applications
  end

  def and_there_are_duplicate_apply_applications
    @importable_apply_application = create(:apply_application, :importable)
    @imported_apply_application = create(:apply_application, :imported)
    @duplicate_apply_application = create(:apply_application, :non_importable_duplicate)
  end

  def when_i_visit_the_duplicate_apply_applications_index_page
    visit users_path
    click_link "Duplicate apply applications"
  end

  def then_i_should_see_the_duplicate_apply_applications
    expect(page).to have_current_path(duplicate_apply_applications_path)
  end
end
