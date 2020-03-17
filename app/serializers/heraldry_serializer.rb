class HeraldrySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :colors, :blazon, :coat_of_arms
  belongs_to :member

  def coat_of_arms
    url_for(object.coat_of_arms) if object.coat_of_arms.attached?
  end
end
