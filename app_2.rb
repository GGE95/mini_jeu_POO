require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Quel est ton prénom, jeune va-t-en-guerre ?"
print "> "
user_name = gets.chomp
puts "Très bien #{user_name}. Nous verrons ce que t'as dans le ventre."
player3 = HumanPlayer.new(user_name)
enemies = []
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies << player1 << player2

while player3.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

  puts "Voici ton état guerrier :"
  player3.show_state
  puts "Maintenant, que veux-tu faire ?"
  puts "> a - chercher une meilleure arme"
  puts "> s - chercher à se soigner"
  puts " Attaquer un joueur en vue :"
  puts "> 0 - Josiane a #{player1.life_points} points de vie"
  puts "> 1 - José a #{player2.life_points} points de vie"
  print "> "
  action = gets.chomp

  if action == "a"
    player3.search_weapon
  elsif action == "s"
    player3.search_health_pack
  elsif action == "0"
    player3.attacks(player1)
  elsif action == "1"
    player3.attacks(player2)
  else puts "T'as rien compris. Tant pis, tu passes ton tour."
    puts ""
  end

  sleep (3)
  puts "Au tour des ennemies de t'attaquer !"
  enemies.each do |enemy|
    enemy.attacks(player3) if enemy.life_points > 0
    sleep (2)
  end

  sleep (4)

end

puts "La partie est finie"
if player3.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else puts "Loser ! Tu as perdu !"
end

