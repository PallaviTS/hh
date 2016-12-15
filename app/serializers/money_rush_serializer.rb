class MoneyRushSerializer < ActiveModel::Serializer
  attributes :id, :place_type, :place_id, :address, :lat, :lng, :name, :cash, :long_queue, :open, :search_by, :created_at, :updated_at, :reported_at, :distance


  def reported_at
    object.reported_at.localtime.strftime("%A, %d %b %Y %l:%M %p") if object.reported_at
  end

  def distance_between(lat1, lon1, lat2, lon2)
    rad_per_deg = Math::PI / 180
    rm = 6371000 # Earth radius in meters

    lat1_rad, lat2_rad = lat1 * rad_per_deg, lat2 * rad_per_deg
    lon1_rad, lon2_rad = lon1 * rad_per_deg, lon2 * rad_per_deg

    a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    result = ( (rm * c)/1000 ).round(2)
    result.to_s + ' km'
  end

  def distance
    locationLatLng = [
      { place: 'yelahanka', lat: 13.135, lng: 77.5891 },
      { place: 'bangalore', lat: 12.9716, lng: 77.5946 },
      { place: 'adugodi', lat: 12.942004, lng: 77.608304 },
      { place: 'marathahalli', lat: 12.959172, lng: 77.697419 },
      { place: 'kadubeesanahalli', lat: 12.942004, lng: 77.608304 },
      { place: 'whitefield', lat: 12.939414, lng: 77.695203 },
    ]
    place = locationLatLng.find { |x| x[:place] == object.search_by }
    if place.present?
      lat = place[:lat]
      lng = place[:lng]
      distance_between object.lat.to_f, object.lng.to_f, lat, lng
    else
      object.distance
    end
  end



end
