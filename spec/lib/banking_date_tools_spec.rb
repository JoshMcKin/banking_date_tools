require 'spec_helper'
include BankingDateTools
describe BankingDateTools, "get_banking_day" do  
  context "padding == 0" do   
    context "no_weekends == true" do
      it "should role date to following banking day if on weekend and no_weekends are true" do
        options = {:padding => 0, :no_weekends => true}
        get_banking_day(Date.parse("2012-03-31"),options).should eql(Date.parse("2012-04-02"))   
      end
  
      it "should role date to following banking day if on weekend and no_weekends are true" do
        options = {:padding => 0, :no_weekends => true, :no_holidays => true, :holidays => [Date.parse("2012-04-02")]}
        get_banking_day(Date.parse("2012-03-31"),options).should eql(Date.parse("2012-04-03"))   
      end
      
      context "previous == true" do
        it "should role date to previous banking day if on weekend and no_weekends are true" do
          options = {:previous => true, :padding => 0, :no_weekends => true}
          get_previous_banking_day(Date.parse("2012-03-31"),options).should eql(Date.parse("2012-03-30"))   
        end
  
        it "should role date to previous banking day if on weekend and no_weekends are true" do
          options = {:previous => true,:padding => 0, :no_weekends => true, :no_holidays => true, :holidays => [Date.parse("2012-03-30")]}
          get_previous_banking_day(Date.parse("2012-03-31"),options).should eql(Date.parse("2012-03-29"))   
        end
        
        it "should role date to previous banking day if padding = 1" do
          options = {:previous => true,:padding => 1}
          get_previous_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-26"))   
        end
        it "should role date to 2 banking days ago padding = 2" do
          options = {:previous => true,:padding => 2}
          get_previous_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-25"))   
        end             
      end 
    end
  end
  
  it "should desc" do
    options = {:padding => 1, :no_weekends => true}
    get_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-28"))    
  end
     
  it "should desc" do
    options = {:padding => 2, :no_weekends => true}
    get_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-29"))  
  end

  it "should desc" do
    options = {:padding => 4, :no_weekends => true}
    get_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-04-02"))     
  end

end
describe BankingDateTools, "get_next_banking_day" do
  it "should desc" do
    options = {:no_weekends => true}
    get_next_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-28"))    
  end
  it "should desc" do
    options = {:padding => 2, :no_weekends => true}
    get_next_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-29"))    
  end
end

describe BankingDateTools, "get_previous_banking_day" do
  it "should desc" do
    options = {:no_weekends => true}
    get_previous_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-26"))    
  end
    
  it "should desc" do
    options = {:padding => 2, :no_weekends => true}
    get_previous_banking_day(Date.parse("2012-03-27"),options).should eql(Date.parse("2012-03-23"))    
  end 
end

