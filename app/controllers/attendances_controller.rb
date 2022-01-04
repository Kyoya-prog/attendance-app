class AttendancesController < ApplicationController

  before_action :set_record
  def index
    @wdays = %w[日 月 火 水 木 金 土]
    day = Date.today
    start_date = Date::new(day.year,day.month, 1)
    end_date = start_date >> 1
    end_date = end_date - 1
    #今何年の取得
    year_name = start_date.year
    @year_name = year_name
    @record = []
    #今月の羅列
    (Date.parse("#{start_date}")..Date.parse("#{end_date}")).each do |date|
      @date = date
      @start_date = start_date
      @end_date = end_date
      record = current_user.attendances.where(updated_at:date.all_day)
      puts record
      puts "record"
      puts date.all_day
      puts "hogehoge"
      @record.append(record)
    end
  end

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
      @record.break_time += @record.break_out - @record.break_in
      puts @record.break_time
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
