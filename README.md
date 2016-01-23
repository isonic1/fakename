# Fakename
A ruby gem to create fake test data. The data is scraped from http://fakena.me.
Please read legal terms at https://fakena.me/legal/ before using.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fakename'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fakename

## Usage
	$ irb
	
	require 'fakename'
	
	data = Fake.new
	
	data.hashed_data <- returns all data in a hash
	data.name <- full name
	data.first_name <- only first name
	data.methods <- see all availble methods

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/isonic1/fakename. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

