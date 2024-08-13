class AddForeingKeyStepModelToDocument < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :step, type: :uuid, foreign_key: true
    add_reference :documents, :model_page, type: :uuid, foreign_key: true
    remove_column :documents, :string
  end
end
