module Subject # Observableによって代替される
  def initialize
    @observers = []
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

require 'observer'

class Employee
  include Observable
  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(salary)
    @salary = salary
    changed
    notify_observers(self)
  end
end

class Payload
  def update(employee)
    puts "#{employee.name}さんの給料を#{employee.salary}に更新しました。"
  end
end

class Taxman
  def update(employee)
    puts "#{employee.name}さんに新しい税金の請求書を送ります。"
  end
end

employee = Employee.new('山田', '営業部', 100000)
payload = Payload.new
employee.add_observer(payload)
employee.add_observer(Taxman.new)
employee.delete_observer(payload)
employee.salary = 200000
