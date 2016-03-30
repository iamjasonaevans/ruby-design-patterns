# Pattern: Singleton
# Type: Creational
# Intent: Ensure a class has only one instance, and provide a global point of access to it.
#    Encapsulated "just-in-time initialization" or "initialization on first use".
# Reference: https://sourcemaking.com/design_patterns/singleton

class SingletonClass
  @@instance = nil

  def self.instance
    @@instance ||= SingletonClass.send(:new)
  end

  private_class_method :new
end

instance1 = SingletonClass.instance
instance2 = SingletonClass.instance

puts instance1 == instance2
puts instance1
puts instance2
