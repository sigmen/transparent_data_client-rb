module TransparentData
  module Actions
    class Add
      attr_reader :client, :source, :method, :parameters

      def initialize(client, source, method, parameters)
        @client = client
        @source = source
        @method = method
        @parameters = parameters
      end

      def call
        TransparentData::Request.call(client, 'add', json: build_json)
      end

      private

      def build_json
        {
          source: source,
          method: method,
          parameters: parameters
        }
      end
    end
  end
end
