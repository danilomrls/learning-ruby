require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      blacklist = blacklist.split(" ")
      grades = JSON.parse(grades)
      
      select_grades = grades.select do |name,grade|
        not blacklist.include?(name)
      end

      sum = 0

      select_grades.each do |name,grade|
        sum += grade        
      end

      return (sum/select_grades.size).to_f  

    end
  
    def no_integers(numbers)
      number_ending  = ["00","25","50","75"]
      numbers = numbers.split(" ")
      ans = ""

      numbers.each do |number|
        if number == "00"
          ans += "Nope "
        elsif number_ending.include?(number[-2..-1])
          ans += "Yep "
        else 
          ans += "Nope "          
        end
      end

      return ans
    end
  
    def filter_films(genres, year)
      films = get_films
  
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
