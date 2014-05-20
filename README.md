# ParamsTree

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]

This is a little helper to turn strings like:

    "default(id,user(group(division(name)),name)),post(id,title),comment(id,author,text(title,body))"

to:

    {
      "default" => {
        "id" => {},
        "user" => {
          "group" => {
            "division" => {
              "name" => {}
            },
            "name" => {}
          },
          "post" => {
            "id" => {},
            "title" => {}
          },
          "comment" => {
            "id" => {},
            "author" => {},
            "text" => {
              "title" => {},
              "body" => {}
            }
          }
        }
      }
    }

Used for `rabl-filters`

## Installation

Add this line to your application's Gemfile:

    gem 'params_tree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install params_tree

## Usage

    ParamsTree::Parser.parse(string) # => nested Hash or nil if non-parseable

## Contributing

1. Fork it ( https://github.com/razum2um/params_tree/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[GV img]: https://badge.fury.io/rb/params_tree.png
[BS img]: https://travis-ci.org/razum2um/params_tree.png
[Gem Version]: https://rubygems.org/gems/params_tree
[Build Status]: https://travis-ci.org/razum2um/params_tree
