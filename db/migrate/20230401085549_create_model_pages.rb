class CreateModelPages < ActiveRecord::Migration[6.1]
  def change
    create_table :model_pages, id: :uuid do |t|
      t.string :name
      t.boolean :active
      t.timestamps
    end
  end
end
