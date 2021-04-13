class Api::V1::User < ApplicationRecord
  has_secure_password

  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true
end
