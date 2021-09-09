# Transparent Data Ruby Client
[![Gem Version](https://badge.fury.io/rb/transparent_data_client-rb.svg)](https://badge.fury.io/rb/transparent_data_client-rb) [![Build Status](https://travis-ci.com/sigmen/transparent_data_client-rbsvg?branch=master)](https://travis-ci.com/sigmen/transparent_data_client-rb)

## Supports

Ruby `>= 2.7`.

## Installation

Add this line to your application's Gemfile:

    gem 'transparent_data_client-rb'

And then execute:

    $ bundle install

Or install with:

    $ gem install transparent_data_client-rb

### Usage
You can call TransparentData API using this:
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
response.body # => { content: {...}}
response.status # => 200
response.headers # => {...}
response.success? # => true
```

#### Configuration

Before using the gem you need to configure some parameters:

```ruby
TransparentData.configure do |config|
    config.username = 'user' # TransparentData username
    config.password = 'password' # TransparentData password
    config.key = 'key' # TransparentData API Key
    config.response_symbolize_keys = true # Symbolize response body keys (default: true)
end
```
