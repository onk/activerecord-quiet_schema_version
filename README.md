# Activerecord::QuietSchemaVersion

## What is this?

`ActiveRecord::Schema.define`'s `version` argument is frequently conflicts, so make it empty.

before:

```
ActiveRecord::Schema.define(version: 2017_05_05_000000)
```

after:

```
ActiveRecord::Schema.define()
```


## Why can it be empty?

This `version` argument shows "Which migration files were executed" and
is used to insert into `schema_migrations` table when `rake db:schame:load` is executed.

If always commit `db/schema.rb` with `db/migrate/xxx`, `version` will be the maximum
version of migration files.

After using this gem, `version` is automatically set the maximum version if not specified.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-quiet_schema_version'
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

