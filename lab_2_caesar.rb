#!/usr/bin/env ruby
require 'rspec'

#######################################################
## YOUR CODE
def get_dictionary(offset)
  dictionary_list = ('a'..'z').zip(('a'..'z').to_a.rotate(offset))
  upper_dictionary_list = dictionary_list.collect{ |e| e.map(&:upcase) }
  Hash[dictionary_list + upper_dictionary_list]
end

def caesar_encrypt(string, offset)
  dictionary = get_dictionary(offset)

  string.chars.map{ |c| dictionary.fetch(c, c) }.join
end

def caesar_decrypt(string, offset)
  dictionary = get_dictionary(offset)
  dictionary_reversed = dictionary.invert

  string.chars.map{ |c| dictionary_reversed.fetch(c, c)}.join
end


#######################################################
## MAIN SECTION -- WHAT YOU WANT TO RUN

encrypted = caesar_encrypt("I do not like Caesar salad", 2)
puts "ENCRYPTED: #{encrypted}"
puts "DECRYPTED: #{caesar_decrypt(encrypted, 2)}"


#######################################################
## TEST SECTION -- Run with 'rspec class_leap_years.rb'
RSpec.describe "Caesar cipher" do
  it "can encrypt a string" do
    expect(caesar_encrypt("hello there", 10)).not_to eq "hello there"
  end

  describe "not case-sensitive" do
    it "can decrypt a string when given the right offset" do
      encrypted = caesar_encrypt("hello there", 10)
      expect(caesar_decrypt(encrypted, 10)).to eq "hello there"
    end

    it "cannot decrypt a string when given the incorrect offset" do
      encrypted = caesar_encrypt("hello there", 10)
      expect(caesar_decrypt(encrypted, 20)).not_to eq "hello there"
    end
  end

  describe "case-sensitive" do
    it "can decrypt a string when given the right offset" do
      encrypted = caesar_encrypt("Hello there", 10)
      expect(caesar_decrypt(encrypted, 10)).to eq "Hello there"
    end

    it "cannot decrypt a string when given the incorrect offset" do
      encrypted = caesar_encrypt("Hello there", 10)
      expect(caesar_decrypt(encrypted, 20)).not_to eq "Hello there"
    end
  end
end
