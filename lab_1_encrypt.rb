#!/usr/bin/env ruby
require 'rspec'

#######################################################
## YOUR CODE
def get_dictionary
  dictionary = {} ## Could also write Hash.new
  letters = ('a'..'z').to_a
  letter_values = letters.reverse

  letters.each_index do |i|
    dictionary[letters[i]] = letter_values[i]
    dictionary[letters[i].upcase] = letter_values[i].upcase
  end

  dictionary
end

def encrypt(string)
  encrypted_string = ''
  string.chars.each do |c|
    encrypted_string << get_dictionary.fetch(c, c)
  end

  return encrypted_string
end

def decrypt(string)
  dictionary_reversed = get_dictionary.invert
  decrypted_string = ''

  string.chars.each do |c|
    decrypted_string << dictionary_reversed.fetch(c, c)
  end

  return decrypted_string
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
