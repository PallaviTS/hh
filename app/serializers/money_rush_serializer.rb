class MoneyRushSerializer < ActiveModel::Serializer
  attributes :id, :place_type, :place_id, :address, :lat, :lng, :name, :cash, :long_queue, :open, :search_by, :created_at, :updated_at, :reported_at, :distance


  def reported_at
    object.reported_at.localtime.strftime("%d %b %Y %l:%M %p") if object.reported_at
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
      { place: 'yelahanka', lat: 13.100485, lng: 77.594013 },
      { place: 'Bangalore', lat: 12.971599, lng: 77.594563 },
      { place: 'adugodi', lat: 12.942004, lng: 77.608304 },
      { place: 'marathahalli', lat: 12.959172, lng: 77.697419 },
      { place: 'Kadubeesanahalli', lat: 12.939414, lng: 77.695203 },
      { place: 'kadubeesanahalli', lat: 12.939414, lng: 77.695203 },
      { place: 'whitefield', lat: 12.969800, lng: 77.749947 },
      { place: 'Bellary Road', lat: 13.134794, lng: 77.616925 },
      { place: 'marathahalli', lat: 12.959172, lng: 77.697419 },
      { place: 'Marathahalli', lat: 12.959172, lng: 77.697419 },
      { place: 'Majestic', lat: 12.976861, lng: 77.572307 },
      { place: 'Koramangala', lat: 12.927923, lng: 77.627108 },
      { place: 'Jayanagar', lat: 12.925007, lng: 77.593803 },
      { place: 'Central Silk Board', lat: 12.917414, lng: 77.624121 },
      { place: 'Nagawara', lat: 13.035004, lng: 77.623541 },
      { place: 'Wilson Garden', lat: 12.948193, lng: 77.597187 },
      { place: 'Vasanth Nagar', lat: 12.991087, lng: 77.592029 },
      { place: 'Jalahalli', lat: 13.052765, lng: 77.541899 },
      { place: 'C V Raman Nagar', lat: 12.985454, lng: 77.663925 },
      { place: 'Kalyan Nagar', lat: 13.028005, lng: 77.639971 },
      { place: 'Hennur Road', lat: 13.038167, lng: 77.647778 },
      { place: 'Hennur', lat: 13.038167, lng: 77.647778 },
      { place: 'Hebbal', lat: 13.035770, lng: 77.597022 },
      { place: 'Devanahalli', lat: 13.241715, lng: 77.713731 },
      { place: 'Indira Nagar', lat: 12.971891, lng: 77.641154 },
      { place: 'JP Nagar', lat: 12.910491, lng: 77.585717 },
      { place: 'HSR Layout', lat: 12.908136, lng: 77.647608 },
      { place: 'Hosur Road', lat: 12.855449, lng: 77.664876 },
      { place: 'Electronic City', lat: 12.839939, lng: 77.677003 },
      { place: 'Kanakapura Road', lat: 12.859996, lng: 77.528998 },
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
