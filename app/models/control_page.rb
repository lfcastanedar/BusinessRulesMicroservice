class ControlPage < ApplicationRecord
    belongs_to :document
    belongs_to :page_control_type
end
