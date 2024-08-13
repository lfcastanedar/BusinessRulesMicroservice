class AddDocumentNumberSequences < ActiveRecord::Migration[6.1]
  def change
    execute "CREATE SEQUENCE document_number_seq INCREMENT BY 1 START WITH 1"
  end
end
