class ComplaintParticipant < ApplicationRecord
    belongs_to :document
    belongs_to :person_type, optional: true
    belongs_to :document_type, optional: true
    belongs_to :health_promoting_entity, optional: true    
    belongs_to :relationship_type, optional: true

    def get_fullname
        self.first_name + " " + self.last_name
    end
end
