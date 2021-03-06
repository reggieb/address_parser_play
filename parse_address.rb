require 'rubygems'
require 'treetop'
require_relative 'address_grammar_nodes'

Treetop.load 'address_grammar'

@parser = AddressGrammarParser.new

def process(text, add_detail = false)
  result = @parser.parse(text.upcase)
  if result
    puts "#{text} #{result.attributes.inspect}"
    #p result.attributes # if add_detail
  else
    puts "#{text} - FAILED"
  end
end

add_detail = true

process '9'
process '129'
process '9 Road'
process 'SOME ROAD'
process '9 Some ROAD'
process '9 Some Other ROAD'
process "9 Some-Other ROAD"
process "9 O'Some ROAD"
process "9 Some-Other-hyphen ROAD"
process "9 O'Some-Other ROAD"
process "9 The Towers, Some Road"
process "9, The Towers, Some Road"
process 'Flat 4, 9 Some Road'
process "Flat 4, 9 The Towers, Some Road"
process "Flat 4, 9, The Towers, Some Road"
process "Flat 4, 9, The Towers, Some Road, Bristol, BS7 8DB"
process "Flat 4, The Towers, Some Road"
process "The Towers, Some Road"
process "9 Evendene"
process "Flat 4, 9, The Towers, Some Road, Bristol"
process "9 Some-Other ROAD, Bristol"
process "9 Evendene, Bristol"
process "9 Some-Other ROAD, Bristol BS7 8DB"
process "9 Some-Other ROAD, Bristol, BS7 8DB"
process "9 Some-Other ROAD, Bristol, Avon, BS7 8DB"
process "9 Some-Other ROAD, Bristol, Avon"
process "9 Some-Other ROAD, Bristol, BS7 8DB, Avon"
process "9 Some-Other ROAD, Bristol BS7 8DB Avon"
process "9 Some-Other ROAD, Bristol BS7 8DB, Avon"
process "185 Some Road, Suburb, Bristol, Avon, BS7 8DB"
process "185 Some Road, Suburb, Bristol, Avon BS7 8DB"
process "185 Some Road, StreetTwo, StreetThree, Bristol, Avon, BS7 8DB"
process "185 Some Road,, StreetTwo, , StreetThree, Bristol, Avon, BS7 8DB"
process 'Flat 1, 12, Long Road, Someton, Worcestershire, WR1 1XX'
process 'Flat 1, Bubble House, 12, Long Road, Someton, Worcestershire, WR1 1XX'
process 'Flat 1, Bubble House, 12 Long Road, Someton, Worcestershire, WR1 1XX'
process "Flat 1,, Bubble House, , 12 Long Road, Someton, Worcestershire, WR1 1XX"
