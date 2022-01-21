class MonthAttendanceCollection
  include AttendancesHelper
  attr_reader :attendances

  def initialize(attendances)
    @attendances = attendances.map { |_date, attendance| attendance }
  end

  def index(i)
    @attendances[i]
  end

  def restraint_time
    result = 0
    @attendances.each do |attendance|
      result += attendance.restraint_time if attendance
    end
    time_to_view_data(result)
  end

  def work_time
    result = 0
    @attendances.each do |attendance|
      result += attendance.work_time if attendance
    end
    time_to_view_data(result)
  end

  def break_time
    result = 0
    @attendances.each do |attendance|
      result += attendance.break_time if attendance
    end
    time_to_view_data(result)
  end
end
