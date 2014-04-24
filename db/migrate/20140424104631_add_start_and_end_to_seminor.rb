class AddStartAndEndToSeminor < ActiveRecord::Migration
  def change
    change_table :seminors do |t|
      t.remove :date

      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
    end
  end
end
