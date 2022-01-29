class Review < ApplicationRecord

    has_and_belongs_to_many :lists
    belongs_to :user, optional: true
end
