# frozen_string_literal: true

class TimelineEvent
  attr_reader :title, :date, :username

  def initialize(title:, date:, username: "No user recorded")
    @title = title
    @date = date
    @username = username
  end
end
