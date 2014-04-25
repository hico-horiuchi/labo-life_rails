class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.integer :user_id, null: false, default: 0
      t.integer :seminor_id, null: false, default: 0

      t.timestamps
    end
  end
end
