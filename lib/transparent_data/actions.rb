require 'transparent_data/request'
require 'transparent_data/actions/add'
require 'transparent_data/actions/result'

module TransparentData
  module Actions
    # See TransparentData::Actions::Add documentation
    def add(source, method, parameters)
      TransparentData::Actions::Add.new(client, source, method, parameters).call
    end

    # See TransparentData::Actions::Result documentation
    def result(ident)
      TransparentData::Actions::Result.new(client, ident).call
    end

    private

    def client
      @client ||= Faraday.new(TransparentData.url) do |conn|
        conn.basic_auth(TransparentData.username, TransparentData.password)
      end
    end
  end
end
