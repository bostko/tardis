class CharityCampaignController < ApplicationController
  def index
    @charities = CharityCampaign.all
  end
end
