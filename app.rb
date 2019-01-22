require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'

# call the scrapp_data and save_as_JSON
scrapp_data
save_as_JSON(scrapp_data)
