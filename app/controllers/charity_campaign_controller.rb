class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all
    @categories = Category.all
  end

  def show
    @charity = CharityCampaign.find params[:id]
  end
end
