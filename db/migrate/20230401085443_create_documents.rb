class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents, id: :uuid do |t|
      t.string :title
      t.string :string
      t.string :address

      t.timestamps
    end
  end
end
