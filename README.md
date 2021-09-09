# Transparent Data Ruby Client (NOT READY FOR USE)
[![Gem Version](https://badge.fury.io/rb/transparent_data_client-rb.svg)](https://badge.fury.io/rb/transparent_data_client-rb) [![Build Status](https://travis-ci.com/sigmen/transparent_data_client-rbsvg?branch=master)](https://travis-ci.com/sigmen/transparent_data_client-rb)

## Supports

Ruby `>= 2.4`.

## Installation

Add this line to your application's Gemfile:

    gem 'transparent_data_client-rb'

And then execute:

    $ bundle install

Or install with:

    $ gem install transparent_data_client-rb

### Usage
Two actions are available for using:
* add
```ruby
response = TransparentData.add(source, method, parameters)
```
* result
```ruby
response = TransparentData.result(ident)
```

Response:
```ruby
response.body # => [{...}]
response.status # => 200
response.headers # => {...}
response.success? # => true
```

#### Configuration

Before using the gem you will need to configure some parameters:

```ruby
TransparentData.configure do |config|
    config.url = 'https://transparentdata.pl/' # You can using any another url for test environment
    config.username = 'user' # Username for HTTP Basic
    config.password = 'password' # Password for HTTP Basic
    config.key = 'key' # API Key
    config.response_symbolize_keys = true # Symbolize response body keys (default: true)
end
```
