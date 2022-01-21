class AttendancesWorkInController < AttendancesController
  def create
    new_record = current_user.attendances.build
    new_record.work_in = current_date_time
    if new_record.save
      redirect_to attendances_new_path
    else
      Rails.logger.debug 'error'
    end
  end
end
