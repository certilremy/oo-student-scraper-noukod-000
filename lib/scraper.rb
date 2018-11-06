require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_hashes=[]

    docs = Nokogiri::HTML(open(index_url))

    students_infos = docs.css('.student-card')
    students_infos.each do |student|
      name=student.css('h4').text
      location=student.css('p').text
      profile_url=student.css('a')[0]["href"]
      student_hash={name:name,location:location,profile_url:profile_url}
      students_hashes.push(student_hash)
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
