class CharityCampaign
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :goal, type: BigDecimal
  field :started_at, type: DateTime
  field :deadline, type: DateTime

  mount_uploader :avatar, CharityAvatarUploader
  validates :avatar, :presence => true

  has_one :charity_owner
  has_many :money_transactions, class_name: "MoneyTransaction"
  has_and_belongs_to_many :categories, class_name: "Category"

  def total_amount
    if money_transactions.any?
      money_transactions.map(&:amount).reduce(&:+)
    else
      BigDecimal.new("0")
    end
  end

  def progress_bar_class
    "progress-bar-#{if (total_amount / goal) * BigDecimal.new("100") < BigDecimal.new("50") then "danger" else "success" end}"
  end

  def progress_bar_current
    (total_amount / goal) * BigDecimal.new("100")
  end
end
