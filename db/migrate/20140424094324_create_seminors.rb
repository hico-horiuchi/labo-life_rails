class CreateSeminors < ActiveRecord::Migration
  def change
    create_table :seminors do |t|
      t.datetime :date, null: false
      t.integer :chairman_user_id, null: false
      t.integer :created_user_id, null: false
      t.string :caption

      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
