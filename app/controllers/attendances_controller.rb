# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :set_record
  require 'date'

  def index
    @wdays = %w[日 月 火 水 木 金 土]
    day = params[:year_month] ? Date.parse("#{params[:year_month][0]}-01") : Date.today
    @start_date = day.beginning_of_month
    @end_date = day.end_of_month
    @month = day.month
    @attendances = current_user.attendances.where(work_date: @start_date..@end_date).each_with_object({}) do |attendance, hash|
      hash[attendance.work_date] = attendance
    end
  end

  def new
  end

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
