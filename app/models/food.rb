class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_many :liked_users, through: :likes, source: :user
  validates :comment, presence: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
