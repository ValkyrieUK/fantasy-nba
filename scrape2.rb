require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html"
doc = Nokogiri::HTML(open(url))
puts doc.xpath("//table/tr[td//text()[contains(., 'Western Conference')]]/following-sibling::tr")
