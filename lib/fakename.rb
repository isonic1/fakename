require "fakename/version"
require 'mechanize'

class Fake
  
  def initialize
    agent = Mechanize.new
    agent.get("https://fakena.me/")
    agent.page.link_with(:text => "Generate Fake Name").click
    puts agent.page.title
    @data = Hash[*agent.page.search("td").map { |x| x.children.text }]
  end
  
  def name
    @data['Name:']
  end
  
  def first_name
    name.split[0]
  end
  
  def last_name
    name.split[1]
  end
  
  def gender
    @data['Gender:']
  end
  
  def dob
    @data['Date of Birth:']
  end
  
  def dob_year
    dob.split("-")[0]
  end
  
  def dob_month
    dob.split("-")[1]
  end
  
  def dob_day
    dob.split("-")[2]
  end
    
  def ssn
    @data['Social Security Number:']
  end
  
  def street_address
    @data['Street Address:']
  end
  
  def street_number
    street_address.split[0]
  end
  
  def city_state_zip
    @data['City, State, ZIP:']
  end
  
  def city
    city_state_zip.tr(',','').split[0]
  end
  
  def state
    city_state_zip.tr(',','').split[1]
  end
  
  def zip
    city_state_zip.tr(',','').split[2]
  end
  
  def phone_number
    @data['Phone Number:']
  end
  
  def phone_area_code
    phone_number.tr('()','').split[0]
  end
  
  def first_three_phone_number
    phone_number.split[1].split('-')[0]
  end
  
  def last_four_phone_number
    phone_number.split[1].split('-')[1]
  end
  
  def username
    @data['Username:']
  end
  
  def password
    @data['Password:']
  end
  
  def email
    @data['Temporary Email Address:']
  end
  
  def hashed_data
    @data
  end
end