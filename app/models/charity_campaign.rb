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
  has_many :charity_account_transactions
  has_and_belongs_to_many :categories
end
