#!/usr/bin/env ruby
require 'rspec'

#######################################################
## YOUR CODE
def is_a_leap_year?(year)
  (year % 4 == 0 && year % 100 > 0) || year % 400 == 0
end

def leap_years_between(start_year, end_year)
  (start_year..end_year).collect{ |n| is_a_leap_year?(n) ? n : nil }.compact
end


#######################################################
## MAIN SECTION -- WHAT YOU WANT TO RUN

# puts leap_years_between(1990, 2000)



#######################################################
## TEST SECTION -- Run with 'rspec class_leap_years.rb'
RSpec.describe "leap year exercise" do
  describe "#is_a_leap_year?" do
    it "knows that the Van Halen album title is also a leap year" do
      expect(is_a_leap_year?(1984)).to eq true
    end

    it "knows that the year that Back to the Future was released was NOT a leap year" do
      expect(is_a_leap_year?(1985)).to eq false
    end

    it "says 1600 is a leap year" do
      expect(is_a_leap_year?(1600)).to eq true
    end

    it "says 1800 is not a leap year" do
      expect(is_a_leap_year?(1800)).to eq false
    end
  end

  describe "#leap_years_between" do
    it "knows that the Van Halen album title is also a leap year" do
      expect(leap_years_between(1983, 1985)).to eq [1984]
    end

    it "returns more than one result" do
      expect(leap_years_between(1979, 1989)).to eq [1980, 1984, 1988]
    end

    it "is inclusive of the start and end years" do
      expect(leap_years_between(1980, 1988)).to eq [1980, 1984, 1988]
    end

    it "knows the 100/400 rule" do
      ## years divisible by 100 are not leap years (such as 1800 and 1900) unless they are divisible by 400
      expect(leap_years_between(1600,1600)).to eq [1600]
      expect(leap_years_between(1800,1800)).to eq []
    end
  end
end
