ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("product")

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM products *;")
  end
end
