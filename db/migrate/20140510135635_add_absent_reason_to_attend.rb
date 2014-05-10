class AddAbsentReasonToAttend < ActiveRecord::Migration
  def change
    change_table :attends do |t|
      t.text :absent_reason, default: ""
    end
  end
end
