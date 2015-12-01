require 'date'
module BankingDateTools
  
  def banking_day?(date=Date.today, options={})    
    # defaults
    holidays = options[:holidays] || []
    force_allow_days = options[:force_allow_days] || []

    unless force_allow_days.include?(date)
      return false if options[:no_holidays] && holidays.include?(date)
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
    padding = options[:padding] || 0
    adjusted_padding = (padding.abs + 1)

    increment = (options[:previous] ? -1 : 1)

    adjusted_padding.times do |p|
      date = date.next_day(increment) if p != 0 
      while !banking_day?(date, options)
        date = date.next_day(increment)   
      end
    end
    date
  end

  def get_next_banking_day(date, options={})
    options[:padding] ||= 1
    options[:previous] = false
    get_banking_day(date, options)
  end
    
  def get_previous_banking_day(date, options={})
    options[:padding] ||= 1
    options[:previous] = true
    get_banking_day(date, options)
  end

  def safe_date(date)
    if date.blank?
      return Date.today
    end
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