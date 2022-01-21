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
