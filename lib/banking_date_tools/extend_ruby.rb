Time.class_eval do
  # creates a date integer formated  like a MS.Net date tick
  def tick
    ((self.to_f) *1000).to_i
  end
end

String.class_eval do  
  def to_date
    if self.include?("/") || self.include?("-")
      split = self.split("/") if self.include?("/")
      split = self.split("-") if self.include?("-")
      time = ""
      if split[2] && split[2].include?(":")
        year_time = split[2].split(" ")
        split[2] = year_time[0]
        time = year_time[1]
      end
      safe = "#{split[2]}-#{split[0]}-#{split[1]}"
      safe << " #{time}" unless time.blank?
      return Date.parse(safe) if split.length == 3 && split[2].length == 4
    end
    Date.parse(self)
  end
end
