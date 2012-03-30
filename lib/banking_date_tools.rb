module BankingDateTools
  require 'date'
  require 'banking_date_tools/banking_date_tools'

  def self.root
    File.expand_path(File.dirname(File.dirname(__FILE__)))
  end
  
end
