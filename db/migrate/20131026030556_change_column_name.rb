class ChangeColumnName < ActiveRecord::Migration
  def up
  	rename_column :candidatos, :url_linkedin, :urllinkedin
  end

  def down
  end
end
