class AddForeingKeysToRoles < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :role, type: :uuid, foreign_key: true

    add_reference :role_permissions, :role, type: :uuid, foreign_key: true
    add_reference :role_permissions, :permission, type: :uuid, foreign_key: true
  end
end
