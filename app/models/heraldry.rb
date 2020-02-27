class Heraldry < ApplicationRecord
    belongs_to :member
    has_one_attached :coat_of_arms
end
