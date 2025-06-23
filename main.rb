COLOURS = "ROYGBP"
PEGS = { R: "🔴", O: "🟠", Y: "🟡", G: "🟢", B: "🔵", P: "🟣"}
KEYS = { correct: "⬛", correct_colour: "⬜", incorrect: ""}
RULES = "Guess the secret code! 

Four colour pegs - red, orange, yellow, green, blue, purple. 
Type the first letter for each colour, e.g. ROYG 🔴🟠🟡🟢

Black peg ⬛ - correct colour in correct space
White peg ⬜ - correct colour in wrong space

12 guesses
Good luck!"

def play_game

  code = [COLOURS[rand(0..5)],COLOURS[rand(0..5)],COLOURS[rand(0..5)],COLOURS[rand(0..5)]]
  turns =  0
  plays = []
  won = false

  puts RULES

  # For debugging only - shows 

  # string_rep = ""
  # for peg in code do
  #   string_rep += PEGS[peg.to_sym]
  # end
  # puts string_rep

  while turns < 12
    guess_string = ""
    key_pegs = []
    key_string = ""
    code_remainder = []
    guess_remainder = []
    current_guess = []
    valid_guess = false

    while !valid_guess
      puts "What is your guess?"
      current_guess = gets.chomp.upcase.split("")
      if current_guess.length != 4
        puts "Incorrect length. Four colours required."
      elsif !(current_guess - COLOURS.split("")).empty?
        puts "Invalid input. Type the first name of the colour: R, O, Y, G, B, P."
      else
        valid_guess = true
      end
    end

    for peg in current_guess do
      guess_string += PEGS[peg.to_sym]
    end

    code.each_with_index do |peg,idx|
      if peg == current_guess[idx]
        key_pegs << "correct"
      else
        code_remainder << peg
        guess_remainder << current_guess[idx]
      end 
    end

    for colour in COLOURS.split("") do
      right_colour_wrong_space = [guess_remainder.count(colour),code_remainder.count(colour)].min
      for peg in (1..right_colour_wrong_space)
        key_pegs << "correct_colour"
      end
    end

    # Ensures no additional information can be gained from the order of the black and white pegs
    key_pegs.sort!

    for key in key_pegs do
      key_string += KEYS[key.to_sym]
    end

    turns += 1

    plays << turns.to_s + "\t" + guess_string + "\t" + key_string

    puts "\t⚫⚫⚫⚫"
    for play in plays
      puts play
    end

    if key_pegs == ["correct","correct","correct","correct"]
      puts "Congratulations! You won!"
      won = true
      break
    end

  end
  
  if !won
    puts "You lost - better luck next time!"
  end

end

play_game
