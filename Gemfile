source "https://rubygems.org"
ruby "2.4.1"

# sensitive data in its place :)
gem "dotenv-rails", require: "dotenv/rails-now"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5"

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use postgresql as de database for Active Record
gem "pg"

# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# fix warning --jbuilder
# https://stackoverflow.com/questions/40986923/meaning-of-expected-string-default-value-for-on-ruby-on-rails
#gem 'thor', '0.19.1'

# Use slim to generate views
gem "slim-rails"

# Use Twitter Bootstrap!
gem "bootstrap-sass", "~> 3.3.6"

gem "devise"

# forms and nested attributes
gem "simple_form"
gem "cocoon"

# countries data
gem "country_select", require: "country_select_without_sort_alphabetical"

# Validate dates
gem "validates_timeliness", "~> 4.0"

# queue
gem "delayed_job_active_record"

# Follow coding standards!
gem "rubocop", require: false
gem "rubocop-rails"
gem "rubocop-rspec"

# Authorization
gem "pundit"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri

  gem "rspec-rails", "~> 3.5"

  # bring back 'assigns'
  gem "rails-controller-testing"

  gem "factory_bot_rails"
  gem "ffaker"

  # lets generate some layouts with bootstrap...
  gem "rails_layout"

  # lets generate scaffolds with bootstrap
  gem "bootstrap-generators", "~> 3.3.4"
end

group :test do
  gem "shoulda-matchers", "~> 3.1"
  gem "pundit-matchers", "~> 1.4.1"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
