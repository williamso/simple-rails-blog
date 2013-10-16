class RemoveRatingFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :rating
  end

  def down
    add_column :posts, :rating, :string
  end
end
