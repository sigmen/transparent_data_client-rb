# TransparentData RB
[![Gem Version](https://badge.fury.io/rb/transparent_data-rb.svg)](https://badge.fury.io/rb/transparent_data-rb) [![Build Status](https://travis-ci.com/sigmen/transparent_data-rb.svg?branch=master)](https://travis-ci.com/sigmen/transparent_data-rb)

# UNDER DEVELOPMENT

## Supports

Ruby `>= 2.4`.

## Installation

Add this line to your application's Gemfile:

    gem 'transparent_data-rb'

And then execute:

    $ bundle install

Or install with:

    $ gem install transparent_data-rb

### Usage

```ruby
response = TransparentData.search(country_name, query)

response.body # => [{...}]
response.status # => 200
response.headers # => {...}
```

#### Search options
* country_name - Any available country name (see Available countries)
* query - Search query

#### Available countries
Gem supports all available Transparentdata.eu countries:
* finland
* uk
* denmark
* norway
* slovakia
* czech

#### Configuration

Before using gem you need to configure some parameters:

```ruby
TransparentData.configure do |config|
    config.url = 'https://transparentdata.eu/' # You can using any another url for test environment
    config.user = 'user' # Username for HTTP Basic
    config.password = 'password' # Password for HTTP Basic
    config.key = 'key' # API Key
end
```
