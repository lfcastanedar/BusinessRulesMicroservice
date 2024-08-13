class AddCodeToModule < ActiveRecord::Migration[6.1]
  def change
    add_column :model_pages, :code, :string
  end
end
