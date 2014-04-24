class AddPlaceToSeminor < ActiveRecord::Migration
  def change
    change_table :seminors do |t|
      t.string :place, null: false, default: ""
    end
  end
end
