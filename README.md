# Folio

This is the source code of a [little folio](https://ketfikevin.herokuapp.com) I made for a friend.

## UP & RUNNING

* `git clone git@github.com:Spharian/folio.git && cd folio`
* `cp config/database.example.yml config/database.yml`
* `bundle install`
* `bundle exec rake db:setup`
* `rails s`
* Open your browser to `http://localhost:3000`

### Default users

You can create default admin users from editing the `db/seeds.rb` file.

## Requirements

* [Ruby 2.2.1](https://ruby-doc.org/core-2.2.1)
* [Postgresql](https://www.postgresql.org)

## Stacks

* [Ruby on Rails](http://rubyonrails.org)
* [ActiveAdmin](https://activeadmin.info)
* [Paperclip](https://github.com/thoughtbot/paperclip)
* [AWS](https://aws.amazon.com)
