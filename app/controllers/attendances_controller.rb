class AttendancesController < ApplicationController
  include AttendancesHelper
  before_action :set_record
  def index
    @wdays = %w[日 月 火 水 木 金 土]
    day = Date.today
    @start_date = Date::new(day.year,day.month, 1)
    @end_date = Date::new(day.year,day.month, -1)
    @data = []
    restraint_amount = 0
    work_amount = 0
    break_amount = 0
    (Date.parse("#{@start_date}")..Date.parse("#{@end_date}")).each do |date|
      @date = date
      record = current_user.attendances.where(updated_at:date.all_day).first
      if record
        restraint_amount += record.restraint_time()
        work_amount += record.work_time()
        break_amount += record.break_time
      end
      record ||= current_user.attendances.build
      @data.append record
    end
    @restraint_data = time_to_view_data(restraint_amount)
    @work_data = time_to_view_data(work_amount)
    @break_data = time_to_view_data(break_amount)
  end

  def new
  end

  def register_work_in
    puts "@record"
      new_record = current_user.attendances.build
      new_record.work_in = current_date_time
      if new_record.save
        redirect_to attendances_new_path
      else
        puts "error"

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
      @record.break_time += @record.break_out - @record.break_in
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
    current_attendance = current_user.attendances.where(updated_at:Date.today.all_day).first
    if current_attendance == nil
      current_attendance = current_user.attendances.new()
    end
    return current_attendance
  end

  def set_record
    @record = fetch_current_attendance
  end
end
