class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
	  t.integer  :post_id
      t.string   :name
      t.string   :email
      t.string   :url_linkedin
      t.timestamps
    end
  end
end
