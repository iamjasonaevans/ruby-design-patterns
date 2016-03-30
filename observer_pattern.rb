# Pattern: Observer Pattern
# Type: Behavorial Pattern
# Intent: Define a one-to-many dependency between objects so that when one object
#   changes state, all its dependents are notified and updated automatically.

module Observer
  attr_reader :observers

  def initialize
    @observers = Array.new
  end

  def register(observer)
    puts "[subject ] Registering client: #{observer}"
    @observers << observer
  end

  def unregister(observer)
    puts "[subject ] Unregistering client: #{observer}"
    @observers.delete(observer)
  end

  def notify_observers(message)
    @observers.each { |o| o.receive_message(message) }
  end
end

class Subject
  include Observer

  def initialize
    super
  end

  def send_message(message)
    notify_observers(message)
  end
end

class Client
  def register(subject)
    @subject = subject
    @subject.register(self)
  end

  def unregister
    @subject.unregister(self)
  end

  def receive_message(message)
    puts "[observer] Received: #{message} / #{self}"
  end
end

s1 = Subject.new()
c1 = Client.new()
c2 = Client.new()
c3 = Client.new()
c1.register(s1)
c2.register(s1)
c3.register(s1)
s1.send_message("this is a test message")
c3.unregister
s1.send_message("there are now only two observers")
