# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'interactor'
gem 'active_model_serializers'
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem 'aasm'
gem "devise", "~> 4.9"
gem "devise-jwt", "~> 0.12.1"
gem "bcrypt", "~> 3.1"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'super_awesome_print'
  gem 'rails_best_practices'
  gem 'foreman'
  gem 'bullet'
  gem 'annotate'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'faker'
  gem 'rubocop'
  gem 'simplecov'
  gem 'rubycritic'
  gem 'rack-cors'
  gem 'rack-attack'
  gem 'rails-erd'
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
