class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: self


  belongs_to :role
  belongs_to :family_commissary
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def get_fullname
    self.first_name + " " + self.last_name
  end
  
  def get_sidebar
    user = self
    user = user.role.permissions
    user = user.collect(&:sidebar).flatten.uniq
    user = user.sort_by(&:order)
    user 
  end
end
