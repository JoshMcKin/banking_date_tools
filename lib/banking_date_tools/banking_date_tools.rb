require 'date'
module BankingDateTools
  
  def banking_day?(date=Date.today, options={})
    date = Date.today if date.nil?
    # Set defaults
    options = {
      :holidays => [],
      :force_allow_days => []
    }.merge!(options)
        
    unless options[:force_allow_days].include?(date)
      return false if options[:no_holidays] && options[:holidays].include?(date)
      if options[:no_weekends] 
        return false if (date.saturday? || date.sunday?)
      else
        return false if options[:no_saturdays] && date.saturday?
        return false if options[:no_sundays] && date.sunday?
      end
    end
    true
  end
     
  def get_banking_day(date, options={})
    options = ({:padding => 0, :previous => false}.merge(options))
    adjusted_padding = (options[:padding].abs + 1)
    increment = (options[:previous] ? -1 : 1)
    adjusted_padding.times do |p|
      date = (date + increment ) if p != 0 
      while !banking_day?(date, options)
        date = (date + increment )    
      end
    end
    date
  end

  def get_next_banking_day(date, options={})
    options = ({:padding => 1, :previous => false}.merge(options))
    get_banking_day(date, options)
  end
    
  def get_previous_banking_day(date, options={})
    options = ({:padding => 1, :previous => true}.merge(options))
    get_banking_day(date, options)
  end

  def safe_date(date)
    if date.blank?
      return Date.today
    end
#    if date.class == String
#      if date.include?("/") || date.include?("-")
#        split = date.split("/") if date.include?("/")
#        split = date.split("-") if date.include?("-")
#        time = ""
#        if split[2] && split[2].include?(":")
#          year_time = split[2].split(" ")
#          split[2] = year_time[0]
#          time = year_time[1]
#        end
#        safe = "#{split[2]}-#{split[0]}-#{split[1]}"
#        safe << " #{time}" unless time.blank?
#        return safe if split.length == 3 && split[2].length == 4
#      end
#    end
    date.to_date
  end
  
  # creates a date integer formated  like a MS.Net date tick
  def tick(date=nil)
    if date.blank?
      date = Time.now
    else
      date = date.to_time
    end
    date.tick
  end
end