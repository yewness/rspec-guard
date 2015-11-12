Rails.application.routes.draw do
  # get '/new'
  resources :users
  root 'users#new'
  get   '/referrals'   => 'users#referrals'
  get '/refer_a_friend' => 'users#refer'
  # authenticated :user do
  #   root :to => 'users#new', as: :authenticated_root
  # end
end
