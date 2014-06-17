# Columns [![Gem Version](https://badge.fury.io/rb/columns.svg)](http://badge.fury.io/rb/columns)

Annotates activerecord models using `db/schema.rb`.

This is an alternative to the annotate gem for non rails apps.

## Installation

Add this line to your application's Gemfile:

    gem 'columns'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install columns

## Usage

    $ cd your_project

Once you have generate a `db/schema.rb`, just type the following to
annotate your models:

    $ columns

### Do it programmaticaly

Instead of using Columns as a shell command, you can use it as a
library. To do so, call the following method:

``` ruby
require 'columns'

Columns.execute
```

Note that models must to reside in `app/models`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/columns/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
