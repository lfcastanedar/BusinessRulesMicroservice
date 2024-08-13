class AddProcessNumberToDocument < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :document_number, :string
  end
end
