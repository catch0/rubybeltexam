Rails.application.routes.draw do
   root 'users#index'
   post '/users' => 'users#create'
    
   get '/groups' => 'groups#index'
   get '/groups/:id' => 'groups#show'
   post '/groups' => 'groups#create'
   delete '/groups/delete/:id' => 'groups#destroy'
   
   post '/members/:id' => 'members#create'
   get '/members/:id' => 'members#create'
   get '/members/delete/:id' => 'members#destroy'
    
   delete '/sessions' => 'sessions#destroy'
   post '/sessions' => 'sessions#create'
end
