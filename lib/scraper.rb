require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url)).css(".student-card")
    doc.map do |info| 
       name = info.css("h4.student-name").text
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

