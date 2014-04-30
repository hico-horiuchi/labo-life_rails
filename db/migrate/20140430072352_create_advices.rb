class CreateAdvices < ActiveRecord::Migration
  def change
    create_table :advices do |t|
      t.text :content, null: false, default: ""
      t.integer :user_id, null: false, default: 0
      t.integer :report_id, null: false, default: 0

      t.timestamps
    end
  end
end
