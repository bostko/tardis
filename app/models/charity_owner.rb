class CharityOwner
  include Mongoid::Document

  field :name

  has_many :charity_campaigns
end
