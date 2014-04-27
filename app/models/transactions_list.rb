class TransactionList
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def expenses
    expense_transactions = @transactions.select(&:expense?)
    sum_transactions expense_transactions
  end

  def revenue
    profit_transactions = @transactions.select(&:profit?)
    sum_transactions profit_transactions
  end

  def total
    sum_transactions @transactions
  end

  private

  def sum_transactions(transactions)
    if transactions.any?
      transactions.map(&:amount).inject(BigDecimal.new("0.0"), &:+)
    else
      BigDecimal.new("0.0")
    end
  end
end
