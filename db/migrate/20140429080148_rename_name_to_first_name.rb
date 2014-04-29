class RenameNameToFirstName < ActiveRecord::Migration
  def change
    change_table :users do |u|
      rename_column :users, :name, :first_name
    end
  end
  
end
