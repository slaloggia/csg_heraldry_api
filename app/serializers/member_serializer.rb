class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :rank, :focus, :joined, :heraldry
  has_one :heraldry
end
