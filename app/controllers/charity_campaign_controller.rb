class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all
  end

  def show
    @charity = CharityCampaign.find params[:id]
  end
end
