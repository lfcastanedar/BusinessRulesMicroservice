class CreateComplaintParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :complaint_participants, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :neighborhood
      t.string :address
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :age
      t.string :occupation
      t.boolean :displaced
      t.timestamps
    end

    add_reference :complaint_participants, :document, type: :uuid, foreign_key: true
    add_reference :complaint_participants, :document_type, type: :uuid, foreign_key: true
    add_reference :complaint_participants, :person_type, type: :uuid, foreign_key: true
    add_reference :complaint_participants, :relationship_type, type: :uuid, foreign_key: true
    add_reference :complaint_participants, :health_promoting_entity, type: :uuid, foreign_key: true
  end
end
