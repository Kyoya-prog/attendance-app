# frozen_string_literal: true

class Attendance < ApplicationRecord
  validates :user_id, presence: true

  def restraint_time
    work_out - work_in
  end

  def work_time
    work_out - work_in - break_time
  end
end
