module TransparentData
  # Implements presenter of response
  # Delegates to #headers, #status and #success? of [Faraday::Response]
  # Available methods:
  # * headers [Hash] - Response headers
  # * status [Integer] - Response status
  # * success? [Bool] - Successful response flag
  # * body [Hash] - Parsed response body
  class Response
    extend Forwardable

    def_delegators :@raw_response, :headers, :status, :success?

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def body
      data = Oj.load(@raw_response.body, symbol_keys: TransparentData.response_symbolize_keys)

      { content: data }
    rescue Oj::ParseError
      { content: @raw_response.body }
    end
  end
end
