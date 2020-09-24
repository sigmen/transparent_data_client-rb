require 'transparent_data/response/struct'

module TransparentData
  class Request
    class << self
      def call(client, method, query: {}, json: {})
        response = client.post(build_path(method, query), json.to_json)

        TransparentData::Response::Struct.new(response)
      end

      private

      def build_path(method, query)
        base_path = "/#{TransparentData.key}/#{method}"

        return base_path unless query&.any?

        base_path.concat("?#{convert_params_to_query(query)}")
      end

      def convert_params_to_query(params)
        params.map { |pair| pair.join('=') }.join('&')
      end
    end
  end
end
