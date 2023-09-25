Rails.application.routes.draw do
devise_for :users
get 'horrors/:horror_id/likes' => 'likes#create'
 get 'horrors/:horror_id/likes/:id' => 'likes#destroy'
get 'horrors/junji' => 'horrors#junji'
get 'horrors/rock' => 'horrors#rock'
get 'horrors/yamayu' => 'horrors#yamayu'
get 'horrors/senka' => 'horrors#senka'
get 'horrors/yuki' => 'horrors#yuki'

get 'horrors/top' => 'horrors#top'

resources :perfumes
resources :sindans
resources :users, only: [:show]
root 'horrors#top'
resources :horrors do

  resources :likes, only: [:create, :destroy]
end


end