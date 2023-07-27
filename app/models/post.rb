class Post < ApplicationRecord
  has_many :comments ,dependent: :destroy
  has_one_attached :img

  validates :user, presence: true

end
