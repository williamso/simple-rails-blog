class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :name
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
