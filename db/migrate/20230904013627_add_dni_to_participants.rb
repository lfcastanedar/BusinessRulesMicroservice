class AddDniToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :complaint_participants, :dni, :string
  end
end
