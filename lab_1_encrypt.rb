#!/usr/bin/env ruby
require 'rspec'

#######################################################
## YOUR CODE
DICTIONARY = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]

def encrypt(string)
  string.chars.map do |c|
    uppercase = c == c.upcase
    letter = DICTIONARY.fetch(c.downcase, c)
    uppercase ? letter.upcase : letter
  end.join
end

def decrypt(string)
  dictionary_reversed = DICTIONARY.invert
  string.chars.map do |c|
    uppercase = c == c.upcase
    letter = dictionary_reversed.fetch(c.downcase, c)
    uppercase ? letter.upcase : letter
  end.join
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
