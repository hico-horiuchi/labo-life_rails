class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :attend_id, null: false, default: 0
      t.string :caption, null: false, default: ""
      t.text :abstract, null: false, default: ""
      t.string :document

      t.timestamps
    end
  end
end
