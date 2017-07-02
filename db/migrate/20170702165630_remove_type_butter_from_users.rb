class RemoveTypeButterFromUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :type_butter
  end

  def down
    add_column :users, :type_butter, :decimal
  end
end
