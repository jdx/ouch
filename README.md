# Ouch [![Build Status](https://travis-ci.org/dickeyxxx/ouch.png?branch=master)](https://travis-ci.org/dickeyxxx/ouch)

Finds you a hospital.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ouch'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ouch
```

## Usage

```ruby
require 'ouch'
hospital = Ouch.find(lat: 34.0736204, lng: -118.4003563)
hospital.name # => "Cedars-Sinai Medical Center"
hospital.address # => "8700 Beverly Boulevard Los Angeles, CA 90048-1865"
hospital.phone # => "310-423-5000"
hospital.number_of_beds # => 914
hospital.types # => ["Nongovernment", "Not-for-profit"]
hospital.website # => "http://www.cedars-sinai.edu"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
