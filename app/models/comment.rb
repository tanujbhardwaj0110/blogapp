class Comment < ApplicationRecord
  belongs_to  :post

    belongs_to  :parent, class_name: 'Comment', optional: true
    has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

    validates :body, presence: true ,length: { maximum: 100 , message: " Comment Body must be less than 100 characters"}
end
