class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :status
      t.string :image
      t.references :user
      t.boolean :comment
      t.references :post
      t.string :number_of_likes

      t.timestamps
    end
  end
end
