class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :password, confirmation: true
    validates :email, presence: true
    validates :contact_number, presence: true, length: { is: 10}

end
