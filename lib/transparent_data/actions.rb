require 'transparent_data/request'
require 'transparent_data/actions/search'
require 'transparent_data/actions/add'
require 'transparent_data/actions/result'

module TransparentData
  module Actions
    def search(country, query_str)
      TransparentData::Actions::Search.new(client, country, query_str).call
    end

    def add(source, method, parameters)
      TransparentData::Actions::Add.new(client, source, method, parameters).call
    end

    def result(ident)
      TransparentData::Actions::Result.new(client, ident).call
    end

    private

    def client
      @client ||= Faraday.new(TransparentData.url) do |conn|
        conn.basic_auth(TransparentData.user, TransparentData.password)
      end
    end
  end
end
