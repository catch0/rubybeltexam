class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :members_in, through: :members, source: :user
  validates :name, :description, presence: true 
end
