# InvoiceGenerator

## Usage

```
params = {
    date: '01.01.2015',
    subject: 'Ihre Rechnung vom 23.03.2015',
    sender_name: 'Bob Miller',
    sender_address: 'FooStreet 1',
    sender_zipcode: '12345',
    sender_city: 'Berlin',
    recipient_name: 'Peter Foo',
    recipient_address: 'FooStreet 1',
    recipient_zipcode: '12455',
    recipient_city: 'Berlin',
    order_date: '01.01.2015',
    total: '100 EUR',
    bank: 'FooBank',
    sender_iban: 'DE1234567',
    sender_bic: 'DE1234567',
    reference: 'Order #1234',
    order: 'Fancy Product Description',
    sender_commercial_register_number: '55555',
    sender_district_court: 'Finanzamt Berlin',
    sender_tax_number: '123453245',
    salutation: 'Sehr geehrte Damen und Herren,',
    farewell: 'Mit freundlichen Grüßen'
}


InvoiceGenerator.generate_invoice('filename.pdf', params)

```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'invoice_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install invoice_generator

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/invoice_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

