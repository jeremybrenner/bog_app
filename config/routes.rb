Rails.application.routes.draw do
  
  root to: 'creatures#index'

  #make it restful
  get '/creatures', to: 'creatures#index'

  get '/creatures/new', to: 'creatures#new'

  get '/creatures/:id', to: 'creatures#show', as: "creature"

  get '/creatures/:id/edit', to: 'creatures#edit', as: "edit_creature"

  post '/creatures', to: 'creatures#create'

  patch '/creatures/:id/', to: 'creatures#update'

  delete '/creatures/:id/', to: 'creatures#delete'

end
