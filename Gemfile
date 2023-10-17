source 'https://rubygems.org'
gemspec

gem 'minitest'

def get_env(name)
  (ENV[name] && !ENV[name].empty?) ? ENV[name] : nil
end

gem 'rails', get_env("RAILS_VERSION")
gem "sqlite3"
