require 'transparent_data/response'

module TransparentData
  class Request
    # @param client [Faraday::Client] HTTP Client
    # @param method [Symbol] HTTP Method
    # @param endpoint [String] Endpoint
    # @param query [Hash] Query params
    # @param body [Hash] Request body
    def initialize(client, method, endpoint, query: {}, body: {})
      @client = client
      @method = method
      @endpoint = endpoint
      @query = query
      @body = body
    end

    # Sends request to TransparentData
    # @returns [TransparentData::Response] Response from service
    def call
      response = @client.post(build_path, @body.to_json)

      log_response(response)

      TransparentData::Response.new(response)
    end

    private

    def build_path
      base_path = "/#{TransparentData.key}/#{@endpoint}"

      return base_path if @query&.empty?

      query = @query.map { |pair| pair.join('=') }.join('&')

      base_path.concat("?#{query}")
    end

    def log_response(response)
      TransparentData.logger.info(TransparentData.log_formatter.call(response))
    end
  end
end
