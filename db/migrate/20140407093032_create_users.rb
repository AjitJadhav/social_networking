class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth
   #   t.string :email
   #   t.string :password
   #   t.string :password_confirmation

      t.timestamps
    end
  end
end
