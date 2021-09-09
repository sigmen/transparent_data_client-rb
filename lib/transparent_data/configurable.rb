module TransparentData
  module Configurable
    def configure
      yield self
    end

    private

    # It initializes reader and writer for each given attribute name
    # @param attributes [Array] List of attributes
    def initialize_config_accessors(*attributes)
      module_eval do
        attributes.each do |attribute|
          define_singleton_method(attribute) do
            instance_variable_get("@#{attribute}") || raise(NotImplementedError, "Need to configure: #{attribute}")
          end

          define_singleton_method("#{attribute}=") do |value|
            instance_variable_get("@#{attribute}") || instance_variable_set("@#{attribute}", value)
          end
        end
      end
    end
  end
end
