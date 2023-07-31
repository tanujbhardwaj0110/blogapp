class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :img
  has_many :comments ,dependent: :destroy

  validates :title, presence: true ,length: { maximum: 20 ,message:  " Title must be less than 20 characters "}
  validates :body, presence: true ,length: { maximum: 200 ,message:  " Body must be less than 200 characters "}

  validates :img , presence: true ,file_size: { less_than_or_equal_to: 2.megabytes }, file_content_type: { allow: ['image/jpeg', 'image/png'] }

end
