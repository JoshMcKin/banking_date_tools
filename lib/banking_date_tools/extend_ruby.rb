Time.class_eval do
  # creates a date integer formated  like a MS.Net date tick
  def tick
    ((self.to_f) *1000).to_i
  end
end

String.class_eval do
  US_DATE_REGEX = /^[0-9]{1,2}[\/\-][0-9]{1,2}[\/\-][0-9]{4}/.freeze
  
  def to_date
    if self =~ US_DATE_REGEX
      Date.strptime(self.gsub('/','-'), "%m-%d-%Y")
    else
      Date.parse(self)
    end
  end

end
