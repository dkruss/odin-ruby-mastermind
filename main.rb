#TO DO:
# - at the start of the game, create an array of four letters
#   - each letter randomly chosen from ROYGBP
# - there should be a Board class or object
#   - this should have a string method displaying each guess and key combination on a new line
# - there should be a hash which maps letters (ROYGBP) to their emojis (🔴🟠🟡🟢🔵🟣)

COLOURS = "ROYGBP"
PEGS = { R: "🔴", O: "🟠", Y: "🟡", G: "🟢", B: "🔵", P: "🟣"}
KEYS = { correct: "⬛", correct_colour: "⬜", incorrect: ""}

code = [COLOURS[rand(0..5)],COLOURS[rand(0..5)],COLOURS[rand(0..5)],COLOURS[rand(0..5)]]
turns =  0
string_rep = ""
plays = []

p code

for peg in code do
  string_rep += PEGS[peg.to_sym]
end

puts string_rep

while turns < 12
  guess_string = ""
  key_pegs = []
  key_string = ""
  code_remainder = []
  guess_remainder = []

  puts "What is your guess?"
  guess = gets.chomp.split("")
  p guess

  for peg in guess do
    guess_string += PEGS[peg.to_sym]
  end

  puts guess_string

  code.each_with_index do |peg,idx|
    if peg == guess[idx]
      key_pegs << "correct"
    else
      code_remainder << peg
      guess_remainder << guess[idx]
    end 
  end

  for colour in COLOURS.split("") do
    right_colour_wrong_space = [guess_remainder.count(colour),code_remainder.count(colour)].min
    for peg in (1..right_colour_wrong_space)
      key_pegs << "correct_colour"
    end
  end

  key_pegs.sort!
  #p key_pegs

  for key in key_pegs do
    key_string += KEYS[key.to_sym]
  end

  puts key_string

  turns += 1

  plays << turns.to_s + "\t" + guess_string + "\t" + key_string

  puts "\t⚫⚫⚫⚫"
  for play in plays
    puts play
  end
  
end
