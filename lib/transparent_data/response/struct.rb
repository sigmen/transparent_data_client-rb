module TransparentData
  module Response
    class Struct
      extend Forwardable

      def_delegators :@response, :headers, :status, :success?

      def initialize(response)
        @response = response
      end

      def body
        JSON.parse(@response.body)
      rescue JSON::ParserError
        @response.body
      end
    end
  end
end
