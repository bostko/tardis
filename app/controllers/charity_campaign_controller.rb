require './app/models/transactions_list.rb'

class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all.select {|x| x.total_amount < x.goal}
  end

  def show
    @charity = CharityCampaign.find params[:id]
    @transaction_list = TransactionList.new @charity.money_transactions
  end

  def happy
    @happy_endings = CharityCampaign.all.select {|x| x.total_amount >= x.goal}
  end
end
