# Changeful
[![Gem Version](https://badge.fury.io/rb/changeful.svg)](http://badge.fury.io/rb/changeful)
[![Build Status](https://travis-ci.org/futureworkz/changeful.svg?branch=master)](https://travis-ci.org/futureworkz/changeful)
[![Dependency Status](https://gemnasium.com/futureworkz/changeful.svg)](https://gemnasium.com/futureworkz/changeful)
[![Code Climate](https://codeclimate.com/github/futureworkz/changeful/badges/gpa.svg)](https://codeclimate.com/github/futureworkz/changeful)
[![Test Coverage](https://codeclimate.com/github/futureworkz/changeful/badges/coverage.svg)](https://codeclimate.com/github/futureworkz/changeful/coverage)
[![Inline docs](http://inch-ci.org/github/futureworkz/changeful.svg)](http://inch-ci.org/github/futureworkz/changeful)
[![security](https://hakiri.io/github/futureworkz/changeful/master.svg)](https://hakiri.io/github/futureworkz/changeful/master)

Do you need to allow your administrator to edit the static content of your views?

Changeful is a gem that converts your static content in your views to be stored into database. Thereafter, administrator can use RailsAdmin or Active Admin to edit the static content.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'changeful'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install changeful
```

After you install Changeful to your Gemfile, you need to run the generator:

```
$ rails generate changeful:install
```

This will generate the migration needed for Changeful

Run the migration to update the schema

```
$ rake db:migrate
```

## Usage

### ERB
```erb
<h1><%= changeful_content(:about_us_title) %></h1>
<div class='about-us-content'>
  <%= changeful_content :about_us_content do %>
    <p>You can also include HTML content as the default content in a block.</p>
    <div class='more-content'>Nested tags are also okay.</div>
  <% end %>
</div>
```

### HAML
```haml
%h1= changeful_content(:about_us_title)
.about-us-content
  = changeful_content :about_us_content do
    %p You can also include HTML content as the default content in a block.
    .more-content Nested tags are also okay.
```

### Slim
```slim
h1 = changeful_content(:about_us_title)
.about-us-content
  = changeful_content :about_us_content do
    p You can also include HTML content as the default content in a block.
    .more-content Nested tags are also okay.
```

The view helper method `changeful_content` will return the content found in Changeful database. You can also set a default if there is no content found.

## Available Options

Key | Accepted Values | What it does
---|---|--- 
`default` | String | It sets the default content to return if the key is not found in database
`type` | `:plain`, `:html` | It tells backend gems to display the correct input field in the backend

## More Examples

```ruby
# In your views
changeful_content(:about_us_title)
changeful_content(:about_us_title, default: 'About Us')
changeful_content(:about_us_title, default: 'About Us', type: :plain) 

# Or you can use the shorter method alias cc
cc :about_us_title
cc :about_us_title, default: 'About Us'
cc :about_us_title, default: 'About Us', type: :plain
```

## Integration with back-end

### ActiveAdmin
Run the following CLI to generate the model

```
$ rails generate changeful:models:active_admin
``` 

By default it will create `changeful_content.rb` in `app/admin` folder with the default configuration.

Note: The default configuration for text editor assumes you are using the `ckeditor` gem, replace the editor accordingly.


### Rails Admin
There are two approaches to set up rails admin.

To include the ALL models manually.

```ruby
# config/initializers/rails_admin.rb

config.included_models = ["Changeful::Content", "YourOwnModel", "YourAnotherModel" ]
```

OR you can run the following CLI to generate the model.

```
$ rails generate changeful:models:rails_admin
```

This will generate `changeful_content.rb` in `app/model` with the default configuration for rails admin.

Note: The default configuration for text editor assumes you are using the `ckeditor` gem, replace the editor accordingly.

In the case where default configuration is not needed, run the following CLI.

```
$ rails generate changeful:model
```

This will generate a fresh `changeful_content.rb` in `app/model`

#### Additional Configuration for Rails Admin
You may wish to deactivate `create` to prevent users from creating records in changeful content.

`destroy` is optional, if the admin delete the record, the `default` option will be trigger and re-create the content accordingly.

```ruby
# config/initializers/rails_admin.rb

config.actions do
  dashboard                     # mandatory
  index                         # mandatory
  new do
    except ['ChangefulContent']
  end
  export
  bulk_delete
  show
  edit
  delete do
    except ['ChangefulContent']
  end
  show_in_app
end
```

## Contributing

1. Fork it ( https://github.com/futureworkz/changeful/fork   )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
Changeful is Copyright © 2015 Futureworkz Pte Ltd. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

## About Futureworkz
<a href='http://www.futureworkz.com' title='Futureworkz - Ruby on Rails development' target='_blank'><img src='https://s3-ap-southeast-1.amazonaws.com/futureworkz/3rd-party/logo.png' alt='Futureworkz - Ruby on Rails development' width=230 height=50/></a>

Changeful is maintained by <a href='http://www.futureworkz.com' title='Futureworkz - Ruby on Rails development' target='_blank'> Futureworkz </a>.
