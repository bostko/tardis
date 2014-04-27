class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all.select {|x| x.total_amount < x.goal}
  end

  def show
    @charity = CharityCampaign.find params[:id]
    @transaction_list = TransactionList.new @charity.money_transactions

    @money_transaction = MoneyTransaction.new
  end

  def happy
    @happy_stories = CharityCampaign.all.select {|x| x.total_amount >= x.goal}
  end

  def new
    @charity_campaign = CharityCampaign.new
  end

  def create
    charity_campaign = CharityCampaign.new(charity_campaign_params)
    charity_campaign.save

    puts charity_campaign.errors.full_messages

    redirect_to charity_campaign
  end

  private

  def charity_campaign_params
    params.require(:charity_campaign).permit(:title, :description)
  end
end
