require 'faraday'
require 'json'

require 'transparent_data/version'
require 'transparent_data/exceptions'
require 'transparent_data/configurable'
require 'transparent_data/actions'

module TransparentData
  extend TransparentData::Configurable
  extend TransparentData::Actions

  initialize_config_accessors(:url, :user, :password, :key)
end
