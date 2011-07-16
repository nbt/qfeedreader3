Qfeedreader3::Application.routes.draw do

  resources :feeds do
    member { post 'refresh' }
  end

  root :to => "feeds#index"

end
#== Route Map
#      refresh_feed POST   /feeds/:id/refresh(.:format) {:action=>"refresh", :controller=>"feeds"}
#             feeds GET    /feeds(.:format)             {:action=>"index", :controller=>"feeds"}
#                   POST   /feeds(.:format)             {:action=>"create", :controller=>"feeds"}
#          new_feed GET    /feeds/new(.:format)         {:action=>"new", :controller=>"feeds"}
#         edit_feed GET    /feeds/:id/edit(.:format)    {:action=>"edit", :controller=>"feeds"}
#              feed GET    /feeds/:id(.:format)         {:action=>"show", :controller=>"feeds"}
#                   PUT    /feeds/:id(.:format)         {:action=>"update", :controller=>"feeds"}
#                   DELETE /feeds/:id(.:format)         {:action=>"destroy", :controller=>"feeds"}
#              root        /(.:format)                  {:controller=>"feeds", :action=>"index"}
