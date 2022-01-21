# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :set_record
  def index
    @wdays = %w[日 月 火 水 木 金 土]
    day = Date.today
    day = Date.parse("#{params[:year_month][0]}-01") if params[:year_month]
    @start_date = day.beginning_of_month
    @end_date = day.end_of_month
    @month = day.month
    @data = []
    @data = current_user.attendances.where(created_at: @start_date.beginning_of_day..@end_date.end_of_day)
  end

  def new
  end

  def register_work_in
    new_record = current_user.attendances.build
    new_record.work_in = current_date_time
    if new_record.save
      redirect_to attendances_new_path
    else
      Rails.logger.debug 'error'

    end
  end

  def register_break_in
    return unless @record || !@record.work_in.nil?

    @record.break_in = current_date_time
    @record.save
    redirect_to attendances_new_path
  end

  def register_break_out
    return unless @record || (!@record.work_in.nil? && !@record.break_in.nil?)

    @record.break_out = current_date_time
    @record.break_time += @record.break_out - @record.break_in
    @record.save
    redirect_to attendances_new_path
  end

  def register_work_out
    return unless @record || !@record.work_in.nil?

    @record.work_out = current_date_time
    @record.save
    redirect_to attendances_new_path
  end

  require 'date'

  private

  def current_date_time
    DateTime.now
  end

  def fetch_current_attendance
    current_attendance = current_user.attendances.where(updated_at: Date.today.all_day).first
    current_attendance = current_user.attendances.new if current_attendance.nil?
    current_attendance
  end

  def set_record
    @record = fetch_current_attendance
  end
end
