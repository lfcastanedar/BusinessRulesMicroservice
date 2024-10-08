class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
