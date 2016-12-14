module MoneyRushData
  module Api
    class Base
      include HTTParty

      base_uri 'https://maps.googleapis.com'

      def initialize(query_string, pagetoken=nil)
        @options = { query: {key: ENV['API_KEY'], query: "#{query_string}", pagetoken: "#{pagetoken}" } }
      end

      def fetch
        self.class.get("/maps/api/place/textsearch/json", @options).parsed_response
      end
    end
  end
end
