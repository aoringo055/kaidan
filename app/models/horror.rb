class Horror < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :horror_tag_relations, dependent: :destroy
    has_many :tags, through: :horror_tag_relations, dependent: :destroy
end
