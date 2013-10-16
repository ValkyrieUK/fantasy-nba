class HomeController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'
    @teams = []
    url = "http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html"
    doc = Nokogiri::HTML(open(url))
    # @teams = Team.all
    # puts doc.css("tr.title:has(td:contains('Western')) ~tr").map {|a| a.search('td')[0].text}
    # p doc.css("tr.title:has(td:contains('Western')) ~tr")
    doc.css("tr.title:has(td:contains('Western')) ~tr").each do |team|
      p team.search('td')[0].text
      # @teams << team.at_css("td:contains('Western') ~tr").text
      @teams << team.search('td')[0].text
    end
  end

  def show
  end
end
