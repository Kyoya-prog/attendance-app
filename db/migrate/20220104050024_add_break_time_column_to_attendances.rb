# frozen_string_literal: true

class AddBreakTimeColumnToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :break_time, :int, default: 0
  end
end
