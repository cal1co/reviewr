class Review < ApplicationRecord

    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    belongs_to :user, optional: true

    has_and_belongs_to_many :lists

    # validates :rating, length:{ minimum:1 }
    validates :title, length:{ minimum:1 }

end
