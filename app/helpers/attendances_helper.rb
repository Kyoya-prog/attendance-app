module AttendancesHelper
  def time_to_view_data(time)
    hour = (time / 3600).round
    minute = (time % 3600 / 60).round
    result = "#{sprintf("%02d",hour)}:#{sprintf("%02d",minute)}"
    return result
  end
end
