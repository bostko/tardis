# class Money
#   include Mongoid::Serializable
#
#   def deserialize(object)
#     object ? (::BigDecimal.new(object.to_s) / 100) : object
#   end
#
#   def serialize(object)
#     object ? (object.round(2) * 100).to_i : object
#   end
#
# end

class CharityAccountTransaction
  include Mongoid::Document

  field :transaction_type, type: String
  field :done_by, type: String
  field :amount, type: Integer # TODO FIXME !!!

  belongs_to :charity_campaign
end
