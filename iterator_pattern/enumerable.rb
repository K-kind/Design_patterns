class Account
  attr_accessor :name, :balance

  def initialize(name, balance=0)
    @name = name
    @balance = balance
  end

  def <=>(other) # この実装が必要
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

my_portfolio = Portfolio.new
mizuho = Account.new('mizuho', 1000)
my_portfolio.add_account(mizuho)
my_portfolio.add_account(Account.new('UFJ', 2000))
puts my_portfolio.any? { |account| account.balance > 1000 }
puts my_portfolio.include? mizuho
