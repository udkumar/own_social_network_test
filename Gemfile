source 'https://rubygems.org'
ruby '~> 2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'merit'
# Used to implement at.js for auto complete mentions/emojis
gem 'jquery-atwho-rails'

# Use twitter bootstrap sass
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'
gem 'pg', '0.21.0'
gem 'mysql2', '< 0.5'

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'guard'
  gem 'guard-rspec', '~> 4.2.8'
end
gem 'puma'


group :development, :test do
  gem 'pg', '0.21.0'
end

group :production do
  gem 'pg', '0.21.0'
  gem 'unicorn'
  gem 'rails_12factor'
end
