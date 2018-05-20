game = Game.new

game.print_title_screen
user_input = gets.chomp

# turn this into a loop
if user_input == ['p' || 'play']
  game.start
elsif user_input == ['i' || 'instructions']
  game.print_instructions
elsif user_input == ['q' || 'quit']
  puts `clear`
  puts 'Goodbye.'
  sleep(1)
  exit
else
  print 'Invalid input - please try again: '
end
