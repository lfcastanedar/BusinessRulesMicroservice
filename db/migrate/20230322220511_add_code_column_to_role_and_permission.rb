class AddCodeColumnToRoleAndPermission < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :code, :string
    add_column :permissions, :code, :string
  end
end
