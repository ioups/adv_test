room_count = 0
treasures_count = 0
health = 5
escaped = false
monster = false
current_room = ""


puts "You are trapped in an endless dungeon. Try to escape and collect treasures along the way"
puts "before an evil monster ends your journey"
puts "to play, type your action choice each turn"

while (health > 0) && (not escaped) do
  #game code
  actions = ['m - move', 's - search']
  puts "Room number #{room_count}"
  puts current_room
  if monster
    puts 'Oh no ! A terrible monster is here'
    actions << 'f - fight'
  end
  print "what do you want to do ? (#{actions.join(', ')})"

  player_action = gets.chomp
  if monster && monster_attack?
    health -= 1
    puts "Ouch, the monster hits you"
  end
  case player_action
  when 'm'
    current_room = create_room
    room_count += 1
    monster = monster?
    escaped = escaped?
  when 's'
    if treasure?
      puts "you have found #{treasure}"
      treasures_count += 1
    else
      puts 'Sorry, nothing interesting here'
    end
  end
end

if health > 0
  puts "yeah, you made it !"
  puts "you explored #{room_count} rooms"
  puts "and find #{treasures_count} treasures"
else
  puts "Oh noooo ! You lose !"
  puts "you explored #{room_count} rooms"
  puts "before you horribly died, and lost all your treasures"
end