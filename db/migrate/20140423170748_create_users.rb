class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :student_no, null: false, default: ""
      t.string :password_digest

      t.integer :state, null: false, default: 0
      t.integer :level, null: false, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :student_no, unique: true
  end
end
