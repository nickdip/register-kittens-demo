# frozen_string_literal: true

module EmitsRequestEvents
  extend ActiveSupport::Concern
  include ApplicationHelper

  included do
    after_action :trigger_request_event
  end

  def trigger_request_event
    if FeatureService.enabled?("google.send_data_to_big_query")
      request_event = BigQuery::RequestEvent.new do |event|
        event.with_request_details(request)
        event.with_response_details(response)
        if respond_to?(:current_user, true)
          event.with_user(current_user)
        end
      end

      BigQuery::SendEventJob.perform_later(request_event.as_json)
    end
  end
end
