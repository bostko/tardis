class CharityCampaign
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :destription, type: String
  field :goal, type: BigDecimal
  field :starded_at, type: DateTime
  field :deadline, type: DateTime

  has_one :charity_owner
  has_many :money_transactions
  has_many :categories
end

