class User < ApplicationRecord
    has_secure_password
    has_many :trees 
    validates :name, uniqueness: true 
    validates :email, uniqueness: true
end
