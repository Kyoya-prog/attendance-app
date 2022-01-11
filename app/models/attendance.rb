# frozen_string_literal: true

class Attendance < ApplicationRecord
  validates :user_id, presence: true

  def restraint_time
    if work_out
      work_out - work_in
    else
      0
    end
  end

  def work_time
    if work_out
      work_out - work_in - break_time
    else
      0
    end
  end
end
