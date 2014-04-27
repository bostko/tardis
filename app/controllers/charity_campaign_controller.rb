class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all.shuffle.select {|x| x.total_amount < x.goal}
  end

  def show
    @charity_campaign = CharityCampaign.find params[:id]
    @transaction_list = TransactionList.new @charity_campaign.money_transactions

    @money_transaction = MoneyTransaction.new
  end

  def happy
    @happy_stories = CharityCampaign.all.select {|x| x.total_amount >= x.goal}
  end

  def new
    @charity_campaign = CharityCampaign.new
  end

  def upload_avatar

  end

  def create
    pp = charity_campaign_params
    pp[:goal] = BigDecimal pp[:goal]
    @charity_campaign = CharityCampaign.new pp
    if params[:charity_campaign][:category_ids]
      @charity_campaign.categories = [(Category.find params[:charity_campaign][:category_ids])]
    end
    @charity_campaign.avatar = params[:charity_campaign][:avatar] if params[:charity_campaign][:avatar]
    if @charity_campaign.save
      redirect_to @charity_campaign
    else
      render :new
    end
  end

  private

  def charity_campaign_params
    params.require(:charity_campaign).permit(:title, :description, :goal, :deadline)
  end
end
