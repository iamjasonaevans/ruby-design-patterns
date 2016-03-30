# Pattern: Strategy Pattern
# Type: Behavorial Pattern
# Intent: Define a family of algorithms, encapsulate each one, and make 
#   them interchangeable. Strategy lets the algorithm vary independently 
#   from clients that use it.

class Samurai 
  attr_accessor :weapon

  def initialize(weapon)
    @weapon = weapon
  end

  def attack
    if block_given?
      yield
    else
      weapon.attack()
    end
  end
end

# Define a family of algorithms
class Sword
  def attack
    puts "Swings sword"
  end
end

class Axe 
  def attack 
    puts "Throws axe"
  end
end

class Knife 
  def attack
    puts "Thrusts knife"
  end
end

# Examples
s = Samurai.new(Sword.new)
s.attack()

s = Samurai.new(Knife.new)
s.attack()

s = Samurai.new(Axe.new)
s.attack()

# Pass a Ruby block, this is interchangable with the encapsulated algorithm
s = Samurai.new(nil)
s.attack do
  puts "Punchs with the fist"
end
