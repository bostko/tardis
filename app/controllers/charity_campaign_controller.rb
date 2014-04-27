require './app/models/transactions_list.rb'

class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all
    @categories = Category.all
  end

  def show
    @charity = CharityCampaign.find params[:id]
    @transaction_list = TransactionList.new @charity.money_transactions
    @categories = Category.all
  end
end
