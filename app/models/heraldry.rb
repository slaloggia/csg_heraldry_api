class Heraldry < ApplicationRecord
    belongs_to :member
    has_one_attached :coat_of_arms
    validates_associated :member
    validates :blazon, presence: true
end
