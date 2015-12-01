$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'benchmark/ips'
require 'banking_date_tools'
require 'rails'
puts `ruby -v`


# HotTub uses persisted blocks in several places.

# Tests performance of passing a known block to block call or yield.

class TestDates
  include BankingDateTools
end


Benchmark.ips do |x|
  date = "2015-12-25".to_date
  holidays = ["2015-12-25".to_date]
  options = {
  	:no_weekends => true,
  	:no_holidays => true,
  	:holidays => holidays
  }

  x.report("get_banking_day") do
    TestDates.get_banking_day(date,options)
  end

end
# ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
# Calculating -------------------------------------
#      get_banking_day     7.874k i/100ms
# -------------------------------------------------
#      get_banking_day     87.720k (± 1.6%) i/s -    440.944k
