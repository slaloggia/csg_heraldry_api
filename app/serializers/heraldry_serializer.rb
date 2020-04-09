class HeraldrySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :colors, :blazon, :coat_of_arms, :member_id
  # belongs_to :member

  def coat_of_arms
    object.coat_of_arms.service_url if object.coat_of_arms.attached?
  end
end
