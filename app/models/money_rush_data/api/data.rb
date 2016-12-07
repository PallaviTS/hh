module MoneyRushData
  module Api
    class Data < MoneyRushData::Api::Base
      def initialize(query_string)
        @query_string = query_string
        dump_data
      end

      def dump_data
        results = MoneyRushData::Api::Base.new(@query_string).fetch
        results.each do |data|
          data_row = MoneyRush.where(place_id: data['place_id']).first
          data_row ||= MoneyRush.create
          data_row.update_attributes({
                                       place_id: data['place_id'],
                                       place_type: @query_string.split('+').first,
                                       address: data['formatted_address'],
                                       lat: data['geometry']['location']['lat'],
                                       lng: data['geometry']['location']['lng'],
                                       name: data['name'],
                                       search_by: @query_string.split('+').join(',')
                                     })
        end
      end
    end
  end
end
