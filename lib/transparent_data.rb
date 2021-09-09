require 'faraday'
require 'logger'
require 'oj'

require 'transparent_data/version'
require 'transparent_data/configurable'
require 'transparent_data/actions'

module TransparentData
  extend TransparentData::Configurable
  extend TransparentData::Actions

  initialize_config_accessors(:url, :username, :password, :key, :response_symbolize_keys, :logger, :log_formatter)

  self.url = 'https://api.transparentdata.pl/key'
  self.logger = Logger.new($stdout)
  self.log_formatter = ->(response) { "TransparentData #{response.env.url} #{response.status} #{response.body}" }
  self.response_symbolize_keys = true
end
