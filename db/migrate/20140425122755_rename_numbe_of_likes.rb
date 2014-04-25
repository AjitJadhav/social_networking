class RenameNumbeOfLikes < ActiveRecord::Migration
  def change
    change_table :posts do |p|
    change_column :posts, :number_of_likes, :integer, :default => 0
    end
  end  
end
