require_relative '../models/transactions_list.rb'

class MoneyTransactionController < ApplicationController
  def index
    charity_campaign = CharityCampaign.find params[:id]
    @transaction_list = TransactionList.new charity_campaign.money_transactions
  end

  def new
  	@money_transaction = MoneyTransaction.new
  end

  def create
    @money_transaction = MoneyTransaction.new money_transaction_params
    @money_transaction.save

    redirect_to @money_transaction.charity_campaign
  end

  private

  def money_transaction_params
    params.require(:money_transaction).permit(:done_by, :amount, :date, :charity_campaign_id)
  end
end
