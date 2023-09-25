class Like < ApplicationRecord
  belongs_to :horror
  belongs_to :user
  validates_uniqueness_of :horror_id, scope: :user_id
end
