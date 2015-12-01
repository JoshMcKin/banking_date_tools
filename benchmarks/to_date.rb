$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'benchmark/ips'
require 'banking_date_tools'
require 'rails'
require 'date'
puts `ruby -v`


# HotTub uses persisted blocks in several places.

# Tests performance of passing a known block to block call or yield.

class TestDates
  include BankingDateTools
end

date_us = "02/12/2015"
date_iso = "2015-02-12"

puts date_us.to_date
puts date_iso.to_date

Benchmark.ips do |x|

  x.report("iso") do
    date_iso.to_date
  end

  x.report("us") do
    date_us.to_date
  end

  x.compare!
end
# V-0.0.3
# ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
# Calculating -------------------------------------
#                  iso     7.429k i/100ms
#                   us     7.551k i/100ms
# -------------------------------------------------
#                  iso     84.458k (± 1.5%) i/s -    423.453k
#                   us     85.018k (± 1.3%) i/s -    430.407k

# Comparison:
#                   us:    85017.8 i/s
#                  iso:    84458.3 i/s - 1.01x slower

# V-0.0.4
# ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
# Calculating -------------------------------------
#                  iso     9.513k i/100ms
#                   us    14.519k i/100ms
# -------------------------------------------------
#                  iso    108.314k (± 1.7%) i/s -    542.241k
#                   us    181.794k (± 1.9%) i/s -    914.697k

# Comparison:
#                   us:   181794.2 i/s
#                  iso:   108313.7 i/s - 1.68x slower
