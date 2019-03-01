class User < ApplicationRecord
  has_secure_password
  validates :email, presence: { message: "Can't Leave it blank"}, length: {minimum: 5}
  validates :contact_number, presence: true, length: {is:10}
  validates :name, presence: true, length: {minimum: 2}
end
