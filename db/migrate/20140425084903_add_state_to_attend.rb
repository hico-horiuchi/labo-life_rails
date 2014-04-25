class AddStateToAttend < ActiveRecord::Migration
  def change
    change_table :attends do |t|
      t.integer :state, null: false, default: 0
    end
  end
end
