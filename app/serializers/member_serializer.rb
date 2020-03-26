class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :guild_name, :rank, :focus, :joined, :heraldry
  has_one :heraldry
end
