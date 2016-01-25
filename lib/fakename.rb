require "fakename/version"
require 'mechanize'

class Fake
  
  def initialize
    agent = Mechanize.new
    agent.get("https://fakena.me/")
    agent.page.link_with(:text => "Generate Fake Name").click
    puts agent.page.title
    @hash = Hash[*agent.page.search("td").map { |x| x.children.text }]
    inst_variable_set(@hash)
  end
  
  def inst_variable_set hash
    hash.each do |var, val|
      var = var.downcase.tr(' ','_').tr(',','').gsub(':','')
      self.class.__send__(:attr_accessor, var)
      self.__send__("#{var}=", val)
    end
  end
  
  def first_name
    @name.split.first
  end
  
  def last_name
    @name.split.last
  end
  
  def dob_year
    @date_of_birth.split("-")[0]
  end
  
  def dob_month
    @date_of_birth.split("-")[1]
  end
  
  def dob_day
    @date_of_birth.split("-")[2]
  end
  
  def street_number
    @street_address.split[0]
  end

  def city
    @city_state_zip.tr(',','').split[0]
  end
  
  def state
    @city_state_zip.tr(',','').split[1]
  end
  
  def zip
    @city_state_zip.tr(',','').split[2]
  end
  
  def phone_area_code
    @phone_number.tr('()','').split[0]
  end
  
  def phone_prefix
    @phone_number.split[1].split('-')[0]
  end
  
  def phone_line_number
    @phone_number.split[1].split('-')[1]
  end
  
  def hashed_data
    @hash
  end
  
  def reload
    initialize
  end
end