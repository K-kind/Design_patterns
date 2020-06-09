class Bank
  attr_reader :balance

  def initialize(initial_balance)
    @balance = initial_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class AccountProtectionProxy
  def initialize(subject, user)
    @subject = subject
    @user = user
  end

  def deposit(amount)
    check_access
    @subject.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @subject.withdraw(amount)
  end

  def balance
    check_access
    @subject.balance
  end

  def check_access
    raise AuthorizationError if @user.nil?
  end
end

account = AccountProtectionProxy.new(Bank.new(4000), 'user')
puts account.balance
puts account.withdraw(2000)

class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def deposit(amount)
    s = subject
    s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    s.withdraw(amount)
  end

  # def balance
  #   s = subject
  #   s.balance
  # end

  def method_missing(method, *args)
    s = subject
    s.send(method, *args)
  end

  def subject
    @subject ||= @creation_block.call
  end
end

account = VirtualAccountProxy.new { Bank.new(4000) }
puts account.balance
