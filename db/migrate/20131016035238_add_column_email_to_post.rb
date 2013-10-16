class AddColumnEmailToPost < ActiveRecord::Migration
  def change
    add_column :posts, :email, :string, limit: 200
  end
end
