class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :img
  has_many :comments ,dependent: :destroy
  has_paper_trail

  validates :title, presence: true ,length: { maximum: 20 ,minimum: 3, message:  " Title must be less than 20 characters "}
  validates :body, presence: true ,length: { maximum: 200 ,minimum: 3, message:  " Body must be less than 200 characters "}

  validates :img , presence: true ,file_size: { less_than_or_equal_to: 2.megabytes }, file_content_type: { allow: ['image/jpeg', 'image/png'] }

end
