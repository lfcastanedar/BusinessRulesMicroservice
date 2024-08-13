class Document < ApplicationRecord
    belongs_to :step
    belongs_to :model_page
    belongs_to :user
    
    has_many :complaint_participants
    has_many :person_types, :through => :complaint_participants

    before_create :set_document_number, :set_title_uppercase

    validates :title, presence: true

    def does_it_have_person_types
        applicant = self.person_types.exists?(code: 'applicant')
        victim = self.person_types.exists?(code: 'victim')
        aggressor = self.person_types.exists?(code: 'aggressor')
        value = false
        if victim && applicant && aggressor
            value = true
        end
        #value = self.person_types.where(code: ['applicant', 'victim', 'aggressor']).count
        value
    end

    private
        def set_document_number
            result = ActiveRecord::Base.connection.execute("SELECT (select code from model_pages mp where id = '#{self.model_page_id}') || nextval('document_number_seq') || '_' || EXTRACT(YEAR FROM CURRENT_DATE)")
            value = result.getvalue(0, 0)
            self.document_number = value
        end

        def set_title_uppercase
            self.title.upcase!
        end
end
