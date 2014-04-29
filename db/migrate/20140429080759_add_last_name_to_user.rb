class AddLastNameToUser < ActiveRecord::Migration
  def change
    change_table :users do |u|
    add_column :users, :last_name, :string
    end
  end
end
