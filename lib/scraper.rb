require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url)).css(".student-card")
    doc.map do |info| 
       name = info.css("h4.student-name").text
       location = info.css("p.student-location").text
       link = info.css("a @href").text
       {:name => name, :location => location, :profile_url => link}
    end
  end

  def self.scrape_profile_page(profile_url)
    collection={}
    doc= Nokogiri::HTML(open(profile_url))
    links = doc.css("div.social-icon-container a").collect{|l| l["href"]}
    links.each do |link|
      if link.include?("twitter")
        collection[:twitter] = link
      elsif link.include?(".com")
        collection[:blog] = link 
      elsif link.include?("github")
        collection[:github] = link 
      elsif link.include?("linkedin")
        collection[:linkedin] = link 
      
        end
      end
    
    collection[:profile_quote] = doc.css(".profile-quote").text.strip
    collection[:bio]
  end

end

