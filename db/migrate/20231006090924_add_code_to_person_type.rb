class AddCodeToPersonType < ActiveRecord::Migration[6.1]
  def change
    add_column :person_types, :code, :string
  end
end
