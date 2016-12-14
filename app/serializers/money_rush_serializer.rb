class MoneyRushSerializer < ActiveModel::Serializer
  attributes :id, :place_type, :place_id, :address, :lat, :lng, :name, :cash, :long_queue, :open, :search_by, :created_at, :updated_at, :reported_at

  def reported_at
    object.reported_at.strftime("%A, %d %b %Y %l:%M %p") if object.reported_at
  end
end
