class Step < ApplicationRecord
    scope :registered_persons, -> { find_by(code: 'registered_persons') }  
    scope :created, -> { find_by(code: 'created') }
end
