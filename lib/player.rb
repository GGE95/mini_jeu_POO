require 'pry'

class Player

	attr_accessor :name,:life_points

  def initialize(name)
		@name=name
    @life_points=10
  end

  #Nb de pts de vie du joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  #Soustraction des pts de vie
  def gets_damage (damage_received)
    @life_points = @life_points - damage_received.to_i
    if @life_points < 1
      @life_points = 0
      puts "Le joueur #{@name} est dead !"
    end
  end

  #Attaque d'un joueur
  def attacks (player)
    puts "#{@name} attaque #{player.name}"
    damage_given = compute_damage
    player.gets_damage (damage_given)
    puts "#{@name} inflige #{damage_given} points de dommages"
    puts ""
  end

  def compute_damage
    return rand(1..6)
  end

end



class HumanPlayer < Player

	attr_accessor :weapon_level, :life_points

  def initialize(name)
    @name = name
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "Tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
    puts ""
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #On trouve une nouvelle arme
  def search_weapon
    nivel = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{nivel}."
    if nivel > @weapon_level
      @weapon_level = nivel
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  #Chercher un pack de pts de vie
  def search_health_pack
    health = rand(1..6)
    if health == 1
      puts "Tu n'as rien trouvé... "
    elsif health < 6
      @life_points = life_points + 50 if @life_points < 51
      @life_points = 100 if @life_points > 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif health == 6
      @life_points = life_points + 80 if @life_points < 21
      @life_points = 100 if @life_points > 20
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end