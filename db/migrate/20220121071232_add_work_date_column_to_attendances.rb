class AddWorkDateColumnToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances,:work_date,:date
  end
end
