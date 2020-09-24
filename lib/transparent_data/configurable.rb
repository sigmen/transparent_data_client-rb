module TransparentData
  module Configurable
    def configure
      yield self
    end

    private

    def initialize_config_accessors(*attributes)
      module_eval do
        attributes.each do |attr|
          define_singleton_method(attr) do
            instance_variable_get("@#{attr}") || raise(NotImplementedError, "Need to configure: #{attr}")
          end

          define_singleton_method("#{attr}=") do |value|
            instance_variable_get("@#{attr}") || instance_variable_set("@#{attr}", value)
          end
        end
      end
    end
  end
end
