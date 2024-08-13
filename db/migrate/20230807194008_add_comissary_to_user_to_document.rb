class AddComissaryToUserToDocument < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :family_commissary, type: :uuid, foreign_key: true
    add_reference :users, :family_commissary, type: :uuid, foreign_key: true
  end
end
