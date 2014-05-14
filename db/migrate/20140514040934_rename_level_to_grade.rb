class RenameLevelToGrade < ActiveRecord::Migration
  def up
    rename_column :users, :level, :grade
  end

  def down
    rename_column :users, :grade, :level
  end
end
