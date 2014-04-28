class AddUserIdAndSeminorIdToReport < ActiveRecord::Migration
  def change
    change_table :reports do |t|
      t.integer :user_id, null: false, default: 0
      t.integer :seminor_id, null: false, default: 0
    end
  end
end
