#!/usr/bin/env ruby
require 'rspec'

#######################################################
## YOUR CODE
def get_dictionary
  dictionary_list = ('a'..'z').zip(('a'..'z').to_a.reverse)
  dictionary_list_upper = dictionary_list.collect{ |e| e.map(&:upcase) }
  Hash[dictionary_list + dictionary_list_upper]
end

def encrypt(string)
  string.chars.map{ |c| get_dictionary.fetch(c, c)}.join
end

def decrypt(string)
  dictionary_reversed = get_dictionary.invert
  string.chars.map { |c| dictionary_reversed.fetch(c, c)}.join
end


#######################################################
## MAIN SECTION -- WHAT YOU WANT TO RUN

encrypted = encrypt("I like pie")
puts "ENCRYPTED: #{encrypted}"
puts "DECRYPTED: #{decrypt(encrypted)}"



#######################################################
## TEST SECTION -- Run with 'rspec class_leap_years.rb'
RSpec.describe "simple encryption/encoding" do
  it "can encrypt a string" do
    expect(encrypt("hello there")).not_to eq "hello there"
  end

  describe "not case-sensitive" do
    it "can decrypt a string" do
      encrypted = encrypt("hello there")
      expect(decrypt(encrypted)).to eq "hello there"
    end

    it "can decrypt a string with punctuation too" do
      encrypted = encrypt("hello there!")
      expect(decrypt(encrypted)).to eq "hello there!"
    end
  end

  describe "case-sensitive" do
    it "can decrypt a string" do
      encrypted = encrypt("Hello there")
      expect(decrypt(encrypted)).to eq "Hello there"
    end
  end
end
