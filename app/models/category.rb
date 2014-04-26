class Category
  include Mongoid::Document

  field :name, type: String

  has_and_belongs_to_many :charity_campaigns, class_name: "CharityCampaign"
end
