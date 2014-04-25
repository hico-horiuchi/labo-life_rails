class ForbidNullToCaption < ActiveRecord::Migration
  def up
    change_column :seminors, :caption, :string, null: false, default: ""
  end

  def down
    change_column :seminors, :caption, :string, null: true
  end
end
