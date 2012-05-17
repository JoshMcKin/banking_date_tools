require 'date'
require 'banking_date_tools/banking_date_tools'
module BankingDateTools
  def self.root
    File.expand_path(File.dirname(File.dirname(__FILE__)))
  end
  
  def self.included(base)
    base.extend(BankingDateTools)
  end
end
