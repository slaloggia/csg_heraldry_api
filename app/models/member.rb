class Member < ApplicationRecord
    has_one :heraldry, optional: true
end
