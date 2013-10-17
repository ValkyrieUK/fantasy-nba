class HomeController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'
    @teams = []
    url = "http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html"
    doc = Nokogiri::HTML(open(url))
    doc.css("tr.title:has(td:contains('Western')) ~tr").map do |team|
      p team.search('td')[0].text
      @teams << team.search('td')[0].text
    end
  end

  def show
  end
end
