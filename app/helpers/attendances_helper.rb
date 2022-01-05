# frozen_string_literal: true

module AttendancesHelper
  def time_to_view_data(time)
    hour = (time / 3600).round
    minute = (time % 3600 / 60).round
    "#{format('%02d', hour)}:#{format('%02d', minute)}"
  end
end
