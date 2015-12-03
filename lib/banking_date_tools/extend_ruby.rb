Time.class_eval do
  # creates a date integer formated  like a MS.Net date tick
  def tick
    ((self.to_f) *1000).to_i
  end

  ONE_DAY = (24 * 60 * 60)
  def next_day(increment=1)
    (self + (ONE_DAY * increment))
  end
end