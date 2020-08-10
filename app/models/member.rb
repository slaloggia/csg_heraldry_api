class Member < ApplicationRecord
    has_one :heraldry
    validates :name, presence: true, uniqueness: true
    validates :rank, inclusion: { in: ["Scholar", "Free Scholar", "Provost", "Dean"], message: "%{value} you must be a Scholar or above in the Chicago Swordplay Guild to register your heraldry" }
    validates :focus, inclusion: { in: ["Renaissance", "Medieval"]}
end
