class List < ApplicationRecord

    has_and_belongs_to_many :reviews
    has_and_belongs_to_many :users
end
