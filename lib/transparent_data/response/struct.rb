module TransparentData
  module Response
    class Struct
      extend Forwardable

      def_delegators :@response, :body, :headers, :status

      def initialize(response)
        @response = response
      end
    end
  end
end
