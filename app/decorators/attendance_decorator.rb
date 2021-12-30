# frozen_string_literal: true

module AttendanceDecorator
  def work_in_button
    button_to "出勤", attendances_work_in_path , {:disabled=> work_in == nil}
  end

  def break_in_button
    button_to "休憩開始", attendances_break_in_path, {:disabled=> (work_in == nil||break_in != nil)}
  end

  def break_out_button
    button_to "休憩完了", attendances_break_out_path, {:disabled=> (work_in == nil || break_in == nil)}
  end

  def work_out_button
    button_to "退勤", attendances_work_out_path, {:disabled=> (break_in != nil && break_out != nil) || work_in == nil }
  end
end