class Attendance < ApplicationRecord
  validates :user_id, presence: true
end
