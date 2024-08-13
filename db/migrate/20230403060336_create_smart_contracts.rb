class CreateSmartContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :smart_contracts, id: :uuid do |t|
      t.string :name
      t.string :version
      t.boolean :active
      t.string :type
      t.text :source

      t.timestamps
    end
  end
end
