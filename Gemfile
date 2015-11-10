# Addressing this issue: https://rorsecurity.info/portfolio/rubygems-security
# TODO: remove when Bundler 2.0 comes
git_source(:github) { |repo| "https://github.com/#{repo.include?('/') ? repo : "#{repo}/#{repo}"}.git" }

source 'https://rubygems.org'

ruby '2.2.3'

gem 'dotenv-rails', groups: [:development, :test]

gem 'rails', '~> 4.2'

gem 'pg'
gem 'postgres_ext'
gem 'schema_plus'

gem 'date_validator'
gem 'devise'
gem 'email_validator'
gem 'fast_blank'
gem 'fixme'
gem 'highline', require: false
gem 'hiredis'
gem 'i18n-tasks', '~> 0.9.0'
gem 'kaminari'
gem 'pry-byebug'
gem 'pry-rails'
gem 'pundit'
gem 'rack-cache'
gem 'rack-canonical-host'
gem 'redis', require: ['redis', 'redis/connection/hiredis']
gem 'redis-rails'
gem 'require_all'
gem 'responders'
gem 'seed_migration'
gem 'show_data'
gem 'simple_enum'
gem 'simple_form'
gem 'sidekiq'
gem 'virtus'

# Front-end gems
gem 'autoprefixer-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'sassc-rails'
gem 'momentjs-rails'
gem 'remotipart', '~> 1.2'
gem 'uglifier', '>= 1.3.0'


group :production, :development do
  gem 'puma'
end

group :development do
  gem 'annotate', '~> 2.6.6'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', '~> 2.4', require: false
  gem 'rack-livereload', github: 'johnbintz/rack-livereload'
  gem 'rb-fsevent', group: :darwin, require: false
  gem 'rb-inotify', group: :linux, require: false
  gem 'quiet_assets'
end

group :test do
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :development, :test do
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
