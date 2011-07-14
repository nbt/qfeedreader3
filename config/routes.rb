Qfeedreader3::Application.routes.draw do

  resources :feeds do
    collection { post 'refresh_all' }
    member { post 'refresh' }
  end

  root :to => "feeds#index"

end
