desc "Fetch teams table"
task :fetch_teams => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html"
  doc = Nokogiri::HTML(open(url))
  puts doc.css("tr.title:has(td:contains('Western')) ~tr").map {|a| a.search('td')[0].text}
end