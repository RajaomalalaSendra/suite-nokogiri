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
	# Downloads to a local file.
	file = session.file_by_title("hello.txt")
	file.download_to_file("/path/to/hello.txt")

	# Updates content of the remote file.
	file.update_from_file("/path/to/hello.txt")
end
# create of the save of the csv
def save_as_csv
	CSV.open("/home/malala/Documents/THP/suite-nokogiri/db/emails.csv", "w")  do |c|
		c << @tabs.getting_the_townhall
	end
end
save_as_JSON
