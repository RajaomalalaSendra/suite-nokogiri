require 'bundler'
require 'json'
require 'csv'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'
# call the scrapp_data and save_as_JSON
@tabs = Scrapper.new
def save_as_JSON
	File.open("/home/malala/Documents/THP/suite-nokogiri/db/emails.json","w") do |f|
		f.write(JSON.pretty_generate(@tabs.perform))
    end
end
# create the spreadsheet methods
def save_as_spreadsheet

end
# create of the save of the csv
def save_as_csv
	CSV.open("/home/malala/Documents/THP/suite-nokogiri/db/emails.csv", "w")  do |c|
	end
end
save_as_JSON
