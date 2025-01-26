# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'pg', '~> 1.5', '>= 1.5.9'
gem 'puma', '~> 6.5'
gem 'rails', '~> 8.0', '>= 8.0.1'

gem 'bootsnap', '~> 1.18', '>= 1.18.4', require: false
gem 'ostruct', '~> 0.6.1'

# Dry-family
gem 'dry-auto_inject', '~> 1.0', '>= 1.0.1'
gem 'dry-container', '~> 0.11', '>= 0.11.0'
gem 'dry-validation', '~> 1.10', '>= 1.10.0'

gem 'rswag', '~> 2.16'

group :development, :test do
  gem 'debug', '~> 1.10', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'dotenv-rails', '~> 3.1', '>= 3.1.7'
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.4'
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails'
end

group :development do
  gem 'reek', '~> 6.4'
  gem 'rubocop-factory_bot', '~> 2.26', '>= 2.26.1'
  gem 'rubocop-performance', '~> 1.23', '>= 1.23.1'
  gem 'rubocop-rails', '~> 2.29'
  gem 'rubocop-rspec', '~> 3.4'
end

group :test do
  gem 'shoulda-matchers', '~> 6.4'
  gem 'simplecov', '~> 0.22.0', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2025', '>= 1.2025.1', platforms: %i[windows jruby]
