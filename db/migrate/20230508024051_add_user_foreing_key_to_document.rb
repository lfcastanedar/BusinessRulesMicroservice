class AddUserForeingKeyToDocument < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :user, type: :uuid, foreign_key: true
  end
end
