source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2', '~> 0.3.11'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',    '~> 3.2.3'
  gem 'coffee-rails',  '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
   gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#START:bcrypt
# To use ActiveModel has_secure_password
#START_HIGHLIGHT
gem 'bcrypt-ruby', '~> 3.0.0'
#END_HIGHLIGHT
#END:bcrypt

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#bundle pack # wrzuca gemy do ktalogu aplikacji
#przygotowuje aplikacje do deployu : #capify .
gem 'capistrano'

gem 'rvm-capistrano'


gem 'will_paginate', '~> 3.0'
gem "sunspot_rails" #biblioteka obslugujaca solar'a

group :development do
  gem 'sunspot_solr'
end
