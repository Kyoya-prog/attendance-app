# frozen_string_literal: true

module AttendanceDecorator
  def work_in_button
    if work_in == nil
      button_to "出勤", attendances_work_in_path , {:disabled=> false}
    else
      button_to "出勤", attendances_work_in_path , {:disabled=> true}
    end
  end

  def break_in_button
    if work_in == nil || work_out
      button_to "休憩開始", attendances_break_in_path, {:disabled=> true }
    elsif break_in != nil && break_out != nil && break_out < break_in # 一回休憩開始と終了を押して、休憩開始のみを押している場合 # 休憩開始していない
      button_to "休憩開始", attendances_break_in_path, {:disabled=> true }
    elsif break_in == nil # 休憩開始をしていない
      button_to "休憩開始", attendances_break_in_path, {:disabled=> false }
    elsif break_out == nil # 休憩開始しているけど休憩終了していない
      button_to "休憩開始", attendances_break_in_path, {:disabled=> true }
    else# 休憩開始もしていないし休憩終了もしていない
      button_to "休憩開始", attendances_break_in_path, {:disabled=> false }
    end
  end

  def break_out_button
    if work_in == nil || work_out
      button_to "休憩終了", attendances_break_out_path, {:disabled=> true }
    elsif break_in != nil && break_out != nil && break_out < break_in # 一回休憩開始と終了を押して、休憩開始のみを押している場合
      button_to "休憩完了", attendances_break_out_path, {:disabled=> false}
    elsif break_in == nil # 休憩開始をしていない
      button_to "休憩完了", attendances_break_out_path, {:disabled=> true}
    elsif break_out != nil #休憩開始してるし、完了もしている
      button_to "休憩完了", attendances_break_out_path, {:disabled=> true}
    else #休憩開始してるが、完了をしていない
      button_to "休憩完了", attendances_break_out_path, {:disabled=> false}
    end
  end

  def work_out_button
    if work_in == nil || work_out
      button_to "退勤", attendances_work_out_path, {:disabled=> true }
    elsif !break_in && break_out
      button_to "退勤", attendances_work_out_path, {:disabled=> true }
    else
      button_to "退勤", attendances_work_out_path, {:disabled=> false }
    end
  end

  def work_in_view_data
    if work_in
      work_in.strftime("%H:%M")
    else
      ""
    end
  end

  def work_out_view_data
    if work_out
      work_out.strftime("%H:%M")
    else
      ""
    end
  end

  def restraint_time_view_data # 拘束時間
    if work_in && work_out
      hour = (restraint_time() / 3600).round
      minute = (restraint_time() % 3600 / 60).round
      result = "#{sprintf("%02d",hour)}:#{sprintf("%02d",minute)}"
      result
    else
      "00:00"
    end
  end

  def work_time_view_data
    if work_in && work_out && break_time
      hour = (work_time() / 3600).round
      minute = (work_time() % 3600 / 60).round
      result = "#{sprintf("%02d",hour)}:#{sprintf("%02d",minute)}"
      result
    else
      "00:00"
    end
  end

  def break_time_view_data
    if !break_time
      time = "#{(break_time / 3600).round}:#{(break_time % 3600 / 60).round}"
      "#{sprintf("%02d",time)}"
    else
      "00:00"
    end
  end
end