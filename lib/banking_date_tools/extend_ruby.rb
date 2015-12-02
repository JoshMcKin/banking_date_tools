Time.class_eval do
  # creates a date integer formated  like a MS.Net date tick
  def tick
    ((self.to_f) *1000).to_i
  end
end