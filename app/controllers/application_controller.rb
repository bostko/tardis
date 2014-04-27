class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_categories, :happy_endings

  def load_categories
  	@categories = Category.all
  end

  def happy_endings
  	@happy_endings = CharityCampaign.all.select{|x| x.total_amount >= x.goal}.take 3
  end

  def pull
    @pull_result = `git pull`
    render 'layouts/pull.js'
  end
end
