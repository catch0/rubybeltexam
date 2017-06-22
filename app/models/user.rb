class User < ActiveRecord::Base
  has_many :groups
  has_many :members
  has_many :groups_in, through: :groups, source: :group
  has_secure_password
        EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i    
 validates :first_name,:last_name, presence: true
 validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
