source 'https://rubygems.org'

gem 'heroku'
gem 'rails', '3.2.8'
gem 'jquery-rails'
gem 'execjs'
gem 'therubyracer'
# for deployment on Heroku

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
end

group :test do
  gem 'factory_girl'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end



