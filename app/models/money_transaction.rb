class MoneyTransaction
  include Mongoid::Document

  field :done_by, type: String
  field :amount, type: BigDecimal
  field :date, type: DateTime

  belongs_to :charity_campaign

  def expense?
    amount < 0
  end

  def profit?
    amount > 0
  end
end
