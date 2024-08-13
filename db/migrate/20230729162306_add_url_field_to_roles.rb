class AddUrlFieldToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :url, :string
  end
end
