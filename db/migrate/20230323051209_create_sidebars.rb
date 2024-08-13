class CreateSidebars < ActiveRecord::Migration[6.1]
  def change
    create_table :sidebars, id: :uuid do |t|
      t.string :title
      t.string :icon
      t.string :path
      t.uuid :sidebar_id
      t.integer :order

      t.timestamps
    end
  end
end
