module TransparentData
  module Actions
    class Result
      # @param client [Faraday::Client] HTTP Client
      # @param ident [String] Dataset ID
      def initialize(client, ident)
        @client = client
        @ident = ident
      end

      # See https://apidoc.transparentdata.pl/dataintegrator.html#endpoint-result
      # @return [TransparentData::Response] response from the service
      def call
        TransparentData::Request.call(@client, :post, 'result', query: { ident: @ident })
      end
    end
  end
end
