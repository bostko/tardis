class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all
    @categories = Category.all
  end
end
