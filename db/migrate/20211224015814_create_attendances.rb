class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.datetime :work_in
      t.datetime :break_in
      t.datetime :break_out
      t.datetime :work_out
      t.timestamps
      t.references :user,foreign_key: true
    end
  end
end
