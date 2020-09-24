module TransparentData
  module Actions
    class Result
      attr_reader :client, :ident

      def initialize(client, ident)
        @client = client
        @ident = ident
      end

      def call
        TransparentData::Request.call(client, 'result', query: build_query(ident))
      end

      private

      def build_query
        { ident: ident }
      end
    end
  end
end
