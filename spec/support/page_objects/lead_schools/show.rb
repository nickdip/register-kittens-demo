# frozen_string_literal: true

module PageObjects
  module LeadSchools
    class Show < PageObjects::Base
      set_url "/system-admin/lead-schools/{id}"

      element :edit_user_data, "a", text: "Edit"
      element :view_funding, "a", text: "View funding"
    end
  end
end
