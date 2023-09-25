class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :horror_tag_relations, dependent: :destroy
    has_many :horrors, through: :horror_tag_relations, dependent: :destroy
end
