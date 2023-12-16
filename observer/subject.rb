# require 'forwardable'

module Subject
  # extend Forwardable

  # def_instance_delegator :@observers, :<<, :add_observer
  # def_instance_delegator :@observers, :delete, :delete_observer

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end
