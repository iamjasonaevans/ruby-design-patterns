require "delegate"
# Pattern: Decorator Pattern


class Decorator < SimpleDelegator
  def shirt
    puts "#{name} is wearing a shirt"
  end
end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hello
    puts "#{name} says hello!!"
  end
end

person = Person.new("Jason")
decorator = Decorator.new(person)
decorator.shirt
decorator.say_hello
