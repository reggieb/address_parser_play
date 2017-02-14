require 'rubygems'
require 'treetop'
require_relative 'address_grammar_nodes'

Treetop.load 'address_grammar'

@parser = AddressGrammarParser.new

def process(text, add_detail = false)
  result = @parser.parse(text.upcase)
  if result
    puts result.text_value
    p result.attributes if add_detail
  else
    puts "FAILED:- #{text}"
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
process "Flat 4, The Towers, Some Road"
process "The Towers, Some Road"
process "9 Evendene"
process "Flat 4, 9, The Towers, Some Road, Bristol"
process "9 Some-Other ROAD, Bristol", add_detail
process "9 Evendene, Bristol"
process "9 Some-Other ROAD, Bristol, BS7 8DB"
process "9 Some-Other ROAD, Bristol BS7 8DB"
process "9 Some-Other ROAD, Bristol, Avon, BS7 8DB", add_detail
process "9 Some-Other ROAD, Bristol BS7 8DB Avon"
process "9 Some-Other ROAD, Bristol BS7 8DB, Avon"
process "185 Pershore Road, Hampton, Evesham, Worcestershire, WR11 2NB"
process "185 Pershore Road, StreetTwo, StreetThree, Evesham, Worcestershire, WR11 2NB", add_detail
