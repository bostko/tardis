require 'bigdecimal'

class TransactionList
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def expenses
    expense_transactions = @transactions.select(&:expense?)
    if expense_transactions.any?
      expense_transactions.map(&:amount).inject(BigDecimal.new("0.0"), &:+)
    else
      BigDecimal.new("0.0")
    end
  end

  def revenue
    profit_transactions = @transactions.select(&:profit?)
    if profit_transactions.any?
      profit_transactions.map(&:amount).inject(BigDecimal.new("0.0"), &:+)
    else
      BigDecimal.new("0.0")
    end
  end

  def total
    @transactions.map(&:amount).inject(BigDecimal.new("0.0"), &:+)
  end
end
