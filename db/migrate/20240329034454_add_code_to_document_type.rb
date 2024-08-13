class AddCodeToDocumentType < ActiveRecord::Migration[6.1]
  def change
    add_column :document_types, :code, :string
  end
end
