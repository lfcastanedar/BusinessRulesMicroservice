class AddPermissionToSideBar < ActiveRecord::Migration[6.1]
  def change
    add_reference :sidebars, :permission, type: :uuid, foreign_key: true
  end
end
