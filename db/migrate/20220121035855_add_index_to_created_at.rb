class AddIndexToCreatedAt < ActiveRecord::Migration[6.1]
  def change
    add_index :attendances,:created_at
  end
end
