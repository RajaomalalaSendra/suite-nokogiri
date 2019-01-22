require 'bundler'
require 'json'
require 'csv'
require 'google_drive'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'
# call the scrapp_data and save_as_JSON
@tabs = Scrapper.new
def save_as_JSON
	File.open("/home/malala/Documents/THP/suite-nokogiri/db/emails.json","w") do |f|
		f.write(JSON.pretty_generate(@tabs.getting_the_townhall))
    end
end
# create the spreadsheet methods
def save_as_spreadsheet
	session = GoogleDrive::Session.from_config("config.json")
	session.upload_from_file("/home/malala/Documents/THP/suite-nokogiri/db/emails.json", "emails.json", convert: false)
end
# create of the save of the csv
def save_as_csv
	File.open("/home/malala/Documents/THP/suite-nokogiri/db/emails.csv", "w") {|f| f.write(@tabs.getting_the_townhall.inject([]) { |csv, row|  csv << CSV.generate_line(row) }.join(""))}
end
save_as_csv
