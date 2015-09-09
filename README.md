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

```ruby
$ bundle install
```

Or install it yourself as:

```ruby
$ gem install changeful
```

After you install Changeful to your Gemfile, you need to run the generator:

```ruby
rails generate changeful:install
```

This will generate the migration needed for Changeful

Run the migration to update the schema

```ruby
rake db:migrate
```

## Usage

### ERB
```ruby
<h1><%= changeful_content(:about_us_title) %></h1>

<div class='about-us-content'>
<%= changeful_content :about_us_content do %>
<p>You can also include HTML content as the default content in a block.</p>
<div class='more-content'>Nested tags are also okay.</div>
<% end %>
</div>
```

### HAML
  ```ruby
%h1= changeful_content(:about_us_title)
  .about-us-content
  = changeful_content :about_us_content do
  %p You can also include HTML content as the default content in a block.
  .more-content Nested tags are also okay.
  ```

### Slim
  ```ruby
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
  Currently it only work well with ActiveAdmin

  Register the model with ActiveAdmin

  ```ruby
  rails g active_admin:resource Changeful::Content
  ``` 

  By default it will create `changeful_content.rb` in `app/admin` folder

#### Configuration for ActiveAdmin

  Copy the setup below to `changeful_content.rb`

  Note: the example below is using `ckeditor` gem, replace the editor accordingly.

  ```ruby
  ActiveAdmin.register Changeful::Content do
  permit_params :content
  actions :all, except: [:new]

  index do
  selectable_column
  id_column
  column :key, ->(row) { row.key.titleize  }
column :content
column :updated_at
actions
end

show do
attributes_table do
row :id
row :file_path
row :key
row :content
row :updated_at
end
end

form do |f|
f.inputs 'Details' do
input :key, input_html: { disabled: true  }
if f.object.view_type == 'html'
input :content, as: :ckeditor
else
input :content
end
end
actions
end
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
<img src='https://s3-ap-southeast-1.amazonaws.com/futureworkz/3rd-party/logo.png' width='300' height='100'/>

Changeful is maintained by Futureworkz.
