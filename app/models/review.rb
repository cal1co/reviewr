class Review < ApplicationRecord

    has_many :likes, dependent: :destroy

    belongs_to :user

    has_and_belongs_to_many :lists

    validates :rating, length:{ minimum:1 }

end
