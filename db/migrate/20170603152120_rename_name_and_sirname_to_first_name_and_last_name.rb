class RenameNameAndSirnameToFirstNameAndLastName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :sirname, :last_name
  end
end
