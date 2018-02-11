# Folio

This is the source code of a [little folio](http://www.ketfikevin.com) I made for a friend.

## Requirements

* Ruby 2.2.1
* Postgresql

## UP & RUNNING

* `git clone https://github.com/Spharian/laravel-react-router-refetch.git && cd folio`
* `cp config/database.example.yml config/database.yml`
* `bundle install`
* `rake db:setup`
* `rails s`
* Open your browser to `http://localhost:3000`

### Default users

You can create default admin users from editing the `db/seeds.rb` file.

### Stacks

* [Ruby on Rails](http://rubyonrails.org)
* [ActiveAdmin](https://activeadmin.info)
* [Paperclip](https://github.com/thoughtbot/paperclip)
* [AWS](https://aws.amazon.com)
