# frozen_string_literal: true

module Dttp
  class RetrieveTrainees
    include ServicePattern
    include SyncPattern

    MAX_PAGE_SIZE = 50

    FILTER = {
      "$filter" => "_dfe_contacttypeid_value eq #{Dttp::Trainee::CONTACT_TYPE_ID}",
    }.freeze

    QUERY = FILTER.to_query

  private

    def default_path
      @default_path ||= "/contacts?#{QUERY}"
    end

    def response
      @response ||= Client.get(request_uri, headers: { "Prefer" => "odata.maxpagesize=#{MAX_PAGE_SIZE}" })
    end
  end
end