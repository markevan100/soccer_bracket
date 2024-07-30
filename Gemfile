source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.0.8", ">= 7.0.8.2"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem "devise", "~> 4.9"

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end