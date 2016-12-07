module MoneyRushData
  module Api
    class Base
      include HTTParty

      base_uri 'https://maps.googleapis.com'

      def initialize(query_string)
        @options = { query: {key: "AIzaSyBSP1ln4k4pVUag50Y9G-c0-JlMvxL9nMs", query: "#{query_string}" } }
      end

      def fetch
        self.class.get("/maps/api/place/textsearch/json", @options).parsed_response['results']
      end
    end
  end
end
