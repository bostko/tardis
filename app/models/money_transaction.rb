class MoneyTransaction
  include Mongoid::Document

  field :transaction_type, type: String
  field :done_by, type: String
  field :amount, type: BigDecimal

  belongs_to :charity_campaign
end
