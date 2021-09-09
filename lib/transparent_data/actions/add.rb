module TransparentData
  module Actions
    class Add
      # @param client [Faraday::Client] HTTP Client
      # @param source [String] Source from which the data should be obtained
      # @param method [String] A method to be called on the target source
      # @param parameters [Hash] The set of parameters depends on the selected source and method. See API Doc.
      def initialize(client, source, method, parameters)
        @client = client
        @source = source
        @method = method
        @parameters = parameters
      end

      # See https://apidoc.transparentdata.pl/dataintegrator.html#endpoint-add
      # @return [TransparentData::Response] response from the service
      def call
        body = { source: @source, method: @method, parameters: @parameters }

        TransparentData::Request.call(@client, :post, 'add', json: body)
      end
    end
  end
end
