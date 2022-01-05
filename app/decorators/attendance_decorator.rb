# frozen_string_literal: true

module AttendanceDecorator
  def work_in_button
    Rails.logger.debug status
    Rails.logger.debug work_in
    Rails.logger.debug break_in
    Rails.logger.debug break_out
    Rails.logger.debug work_out
    button_to '出勤', attendances_work_in_path, { disabled: status.keys.first != :before_work }
  end

  def break_in_button
    button_to '休憩開始', attendances_break_in_path, { disabled: status.keys.first != :work }
  end

  def break_out_button
    button_to '休憩終了', attendances_break_out_path, { disabled: status.keys.first != :break }
  end

  def work_out_button
    button_to '退勤', attendances_work_out_path, { disabled: status.keys.first != :work }
  end

  def worker_status
    status.values.first
  end

  def work_in_view_data
    if work_in
      work_in.strftime('%H:%M')
    else
      ''
    end
  end

  def work_out_view_data
    if work_out
      work_out.strftime('%H:%M')
    else
      ''
    end
  end

  # 拘束時間
  def restraint_time_view_data
    if work_in && work_out
      hour = (restraint_time / 3600).round
      minute = (restraint_time % 3600 / 60).round
      "#{format('%02d', hour)}:#{format('%02d', minute)}"

    else
      '00:00'
    end
  end

  def work_time_view_data
    if work_in && work_out && break_time
      hour = (work_time / 3600).round
      minute = (work_time % 3600 / 60).round
      "#{format('%02d', hour)}:#{format('%02d', minute)}"

    else
      '00:00'
    end
  end

  def break_time_view_data
    if break_time != 0
      hour = (break_time / 3600).round
      minute = (break_time % 3600 / 60).round
      "#{format('%02d', hour)}:#{format('%02d', minute)}"

    else
      '00:00'
    end
  end

  private

  def status
    if work_out && DateTime.now.beginning_of_day < work_out
      { after_work: '退勤後' }
    elsif (break_in && break_out.nil?) || (break_in && break_out && break_out < break_in)
      { break: '休憩中' }
    elsif work_in.nil?
      { before_work: '勤務前' }
    else
      { work: '勤務中' }
    end
  end
end
