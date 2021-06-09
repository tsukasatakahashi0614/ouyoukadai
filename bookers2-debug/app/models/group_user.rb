class GroupUser < ApplicationRecord
  belongs_to :group_users
  belongs_to :user
end
