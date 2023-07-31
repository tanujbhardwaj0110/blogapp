class User < ApplicationRecord
  has_secure_password
  has_many :posts , dependent: :destroy

  validates :username, presence: true, uniqueness: true , length: { in: 4..10 , message: 'Username length must be between 4 and 10' }
  validates :password, presence: true ,length: { in: 6..20 , message:  'Password length must be between 6 and 20'}
  validates :email, presence: true, uniqueness: true , format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is not a valid email address" }

end
