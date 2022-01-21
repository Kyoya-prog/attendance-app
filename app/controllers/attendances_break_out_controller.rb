class AttendancesBreakOutController < AttendancesController
  def create
    return unless @record || (!@record.work_in.nil? && !@record.break_in.nil?)

    @record.break_out = current_date_time
    @record.break_time += @record.break_out - @record.break_in
    @record.save
    redirect_to attendances_new_path
  end
end
