class CreateRolePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :role_permissions, id: :uuid do |t|

      t.timestamps
    end
  end
end
