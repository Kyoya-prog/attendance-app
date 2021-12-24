class AttendancesController < ApplicationController
  def new

  end
  def index

  end

  def register_work_in
    @record = current_user.attendances.last
    if !@record || @record.work_out != nil
      new_record = current_user.attendances.build
      new_record.work_in = current_date_time
      if new_record.save
        redirect_to attendances_path
      else
        puts "error"
        # エラー出す
      end
    else
      #エラー出す
    end
  end

  def register_break_in
    if @record.work_in != nil
      @record.break_in = current_date_time
      @record.update
    end
  end

  def register_break_out
    if @record.work_in != nil && @record.break_in != nil
      @record.break_out = current_date_time
      @record.update
    end
  end

  def register_work_out
    if @record.work_in != nil
      @record.work_out = current_date_time
      @record.update
    end
  end
  require 'date'
  private
  def current_date_time
    DateTime.now
  end
end
