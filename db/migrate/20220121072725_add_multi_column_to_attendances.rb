class AddMultiColumnToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_index :attendances,[:user_id,:work_date]
  end
end
