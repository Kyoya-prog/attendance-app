class AttendancesController < ApplicationController

  before_action :set_record
  def new
    @record = fetch_current_attendance()
    puts @record
    puts "piyopiyo"
  end

  def register_work_in
    puts @record.work_in
    puts @record.break_in
    puts @record.work_out
    puts "@record"
      new_record = current_user.attendances.build
      new_record.work_in = current_date_time
      if new_record.save
        redirect_to attendances_new_path
      else
        puts "error"
        # エラー出す
      end
  end

  def register_break_in
    if @record || @record.work_in != nil
      @record.break_in = current_date_time
      @record.save
      redirect_to attendances_new_path
    end
  end

  def register_break_out
    if @record || @record.work_in != nil && @record.break_in != nil
      @record.break_out = current_date_time
      @record.save
      redirect_to attendances_new_path
    end
  end

  def register_work_out
    if @record || @record.work_in != nil
      @record.work_out = current_date_time
      @record.save
      redirect_to attendances_new_path
    end
  end

  require 'date'
  private
  def current_date_time
    DateTime.now
  end

  def fetch_current_attendance
    current_attendance = current_user.attendances.last
    if current_attendance == nil || current_attendance.work_out
      current_attendance = current_user.attendances.new()
    end
    return current_attendance
  end

  def set_record
    @record = fetch_current_attendance
  end
end
