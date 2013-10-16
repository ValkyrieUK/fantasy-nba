require 'nokogiri'
require 'open-uri'

class Team < ActiveRecord::Base
  validates :hometown, :presence => true
  validates_uniqueness_of :name


  def pull_teams
    url = "http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html"
    doc = Nokogiri::HTML(open(url))
    doc.css("tr.title:has(td:contains('Western')) ~tr").map do |team|
      team.search('td')[0].text
    end
  end

  def refresh_teams
    pull_teams.each do |team|
      Team.find_or_create_by(:name => team)
    end
  end
end
