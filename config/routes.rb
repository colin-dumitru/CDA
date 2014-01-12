CDA::Application.routes.draw do
  root 'application#index'

  get 'transactions/:name' => 'transactions#view'
  post 'transactions/:name/add' => 'transactions#add'

end
