class CreateControlPages < ActiveRecord::Migration[6.1]
  def change
    create_table :control_pages, id: :uuid do |t|
      t.string :name
      t.string :hash_code
      t.string :hash_algorithm
      t.string :format
      t.string :origen
      t.string :created_by

      t.timestamps
    end

    add_reference :control_pages, :document, type: :uuid, foreign_key: true
    add_reference :control_pages, :page_control_type, type: :uuid, foreign_key: true
  end
end
