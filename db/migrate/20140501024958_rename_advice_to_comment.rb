class RenameAdviceToComment < ActiveRecord::Migration
  def change
    rename_table :advices, :comments
  end
end
