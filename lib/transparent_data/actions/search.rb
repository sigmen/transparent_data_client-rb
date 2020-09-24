module TransparentData
  module Actions
    class Search
      COUNTRY_TO_KEY_MAP = {
        finland: :fi,
        czech: :cz,
        denmark: :dk,
        norway: :no,
        slovakia: :sk,
        uk: :uk
      }.freeze

      attr_reader :client, :country, :query_str

      def initialize(client, country, query_str)
        @client = client
        @country = country
        @query_str = query_str
      end

      def call
        search_method = "#{fetch_country_id(country)}Search"

        TransparentData::Request.call(client, search_method, query: build_query(query_str))
      end

      private

      def build_query(query_str)
        { q: query_str }
      end

      def fetch_country_id(country)
        COUNTRY_TO_KEY_MAP.fetch(country.to_s.downcase.to_sym) do
          raise TransparentData::UnknownCountryError, "Unknown country: #{country.inspect}"
        end
      end
    end
  end
end
