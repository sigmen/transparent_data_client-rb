require 'transparent_data/response/struct'

class TransparentData::Request
  QUERY_PARAM = :q

  COUNTRY_TO_KEY_MAP = {
    finland: :fi,
    czech: :cz,
    denmark: :dk,
    norway: :no,
    slovakia: :sk,
    uk: :uk
  }.freeze

  def self.call(client, country, query)
    response = client.post(build_path(country, query))

    TransparentData::Response::Struct.new(response)
  end

  private

  def build_path(country, query)
    "/#{TransparentData.key}/#{fetch_country_id(country)}Search?#{QUERY_PARAM}=#{query}"
  end

  def fetch_country_id(country)
    COUNTRY_TO_KEY_MAP.fetch(country.to_sym) do
      raise TransparentData::UnknownCountryError, "Unknown country: #{country.inspect}"
    end
  end
end
