class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :horrors, dependent: :destroy
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  has_many :likes, dependent: :destroy
  has_many :liked_horrors, through: :likes, source: :horror
  
  def already_liked?(horror)
    self.likes.exists?(horror_id: horror.id)
  end
        end
