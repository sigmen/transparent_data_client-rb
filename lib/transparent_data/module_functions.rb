require 'transparent_data/request'

module TransparentData::ModuleFunctions
  def search(country, query)
    TransparentData::Request.call(client, country, query)
  end

  private

  def client
    @client ||= Faraday.new(TransparentData.url) do |conn|
      conn.basic_auth(TransparentData.user, TransparentData.password)
    end
  end
end
