class AttendancesWorkOutController < AttendancesController
  def create
    return unless @record || !@record.work_in.nil?

    @record.work_out = current_date_time
    @record.save
    redirect_to attendances_new_path
  end
end
