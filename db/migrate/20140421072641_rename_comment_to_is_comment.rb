class RenameCommentToIsComment < ActiveRecord::Migration
  def change
    change_table :posts do |p|
    p.rename :comment, :is_comment
    change_column :posts, :is_comment, :boolean, :default => false
    end
  end  
end
