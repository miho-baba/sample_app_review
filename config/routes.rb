Rails.application.routes.draw do
  get 'lists/new'
  get 'lists' => 'lists#index'
  get 'lists/show'
  get 'lists/edit'
  get '/top' => 'homes#top'
  post 'lists' => 'lists#create' # 投稿機能のためのルーティング
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
