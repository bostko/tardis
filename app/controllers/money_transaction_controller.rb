require 'bigdecimal'
require './app/models/transactions_list.rb'

class MoneyTransactionController < ApplicationController
  def index
    charity_campaign = CharityCampaign.find params[:id]
    @transaction_list = TransactionList.new charity_campaign.money_transactions
  end

  def new
  	@money_transaction = MoneyTransaction.new
  end
end
