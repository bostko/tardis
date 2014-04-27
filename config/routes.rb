Rails.application.routes.draw do

  get '/pull' => 'application#pull'

  get '/money_transaction/:id' => 'money_transaction#index'

  get 'happy-story' => 'charity_campaign#happy'
  get 'category/:id' => 'category#show'

  get '/:id' => 'charity_campaign#show', as: :charity_campaign


  get '/charity_campaign/new' => 'charity_campaign#new', as: :new_charity_campaign

  get '/money_transactions' => 'money_transaction#list', as: :money_transactions
  post '/money_transactions' => 'money_transaction#create', as: :create_money_transactions


  root 'charity_campaign#index', as: :charity_campaigns
  post '/' => 'charity_campaign#create', as: :create_charity_campaign
end
