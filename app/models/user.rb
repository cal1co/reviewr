class User < ApplicationRecord

    has_secure_password

    has_many :reviews

    has_and_belongs_to_many :lists

    validates :email, presence: true, uniqueness: true

    validates :username, presence: true, uniqueness: true

    has_many :likes, dependent: :destroy

end
