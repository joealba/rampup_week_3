#!/usr/bin/env ruby
require 'rspec'

#######################################################
## YOUR CODE
def get_dictionary(offset)
  dictionary = {} ## Or Hash.new
  letters = ('a'..'z').to_a
  letter_values = letters.rotate(offset)

  letters.each_index do |i|
    dictionary[letters[i]] = letter_values[i]
    dictionary[letters[i].upcase] = letter_values[i].upcase
  end

  return dictionary
end

def caesar_encrypt(string, offset)
  dictionary = get_dictionary(offset)

  encrypted_string = ''
  string.chars.each do |c|
    encrypted_string << dictionary.fetch(c, c)
  end

  return encrypted_string
end

def caesar_decrypt(string, offset)
  dictionary = get_dictionary(offset)
  dictionary_reversed = dictionary.invert

  decrypted_string = ''
  string.chars.each do |c|
    decrypted_string << dictionary_reversed.fetch(c, c)
  end

  return decrypted_string
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
