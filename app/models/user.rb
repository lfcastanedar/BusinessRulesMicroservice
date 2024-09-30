class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: self


  belongs_to :role
  belongs_to :family_commissary
  has_many :documents
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def get_fullname
    self.first_name + " " + self.last_name
  end

  def fullname
    "#{first_name} #{last_name}"
  end
  
  def get_sidebar
    user = self
    user = user.role.permissions
    user = user.collect(&:sidebar).flatten.uniq
    user = user.sort_by(&:order)
    user 
  end
end
