require 'bigdecimal'
require './app/models/transactions_list.rb'

class MoneyTransactionController < ApplicationController
  def index
    charity_campaign = CharityCampaign.find params[:id]
    transactions = charity_campaign.money_transactions
    @transaction_list = TransactionList.new transactions
    p @transaction_list.revenue
  end
end
