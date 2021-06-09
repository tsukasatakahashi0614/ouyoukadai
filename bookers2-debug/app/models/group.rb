class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  attachment :group_image
  validates :name, presence: true, uniqueness: true
end
