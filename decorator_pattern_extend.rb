# Pattern: Decorator Pattern

module Decorator
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
person.extend Decorator
person.shirt
person.say_hello
