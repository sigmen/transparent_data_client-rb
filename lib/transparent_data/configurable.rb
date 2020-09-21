module TransparentData
  module Configurable
    def initialize_config_attrs(*attributes)
      module_eval do
        attributes.each do |attr|
          define_singleton_method(attr) do
            instance_variable_get("@#{attr}") || raise(NotImplementedError, "Need to configure: #{attr}")
          end

          define_singleton_method("#{attr}=") do |value|
            public_send(attr) || instance_variable_set("@#{attr}", value)
          end
        end
      end
    end

    def configure
      yield self
    end
  end
end
