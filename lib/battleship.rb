game = Game.new

game.print_title_screen
user_input = gets.chomp

if user_input == 'p' || user_input == 'play'
  game.start
elsif user_input == 'i' || user_input == 'instructions'
  game.print_instructions
elsif user_input == 'q' || user_input == 'quit'
  exit
else
  print "Invalid input - please try again: "
end
