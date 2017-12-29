Rails.application.routes.draw do

  resources :tipo_tropas
	#redireccion a root para usuario y administrador (distinto) tras el login
  get 'dashboard/menu_user' => "dashboard#menu_user", as: :user_root

  get 'dashboard/menu_admin' => "dashboard#menu_admin", as: :admin_root


  get 'dashboard/mostrar_tropas', to: 'dashboard#mostrar_tropas'

  get 'dashboard/adquirir_tropa/:id', to: 'dashboard#adquirir_tropa', as: 'nueva_tropa'

  get 'dashboard/mostrar_recursos', to: 'dashboard#mostrar_recursos'

  get 'dashboard/add_recurso/:id', to: 'dashboard#add_recurso', as: 'add_recurso'

  get 'dashboard/atacar/', to: 'dashboard#atacar'

  get 'dashboard/retirarse/', to: 'dashboard#retirarse', as: 'retirarse'

  get 'dashboard/atacar_enemigo/:id', to: 'dashboard#atacar_enemigo', as: 'atacar_enemigo'



  devise_for :admins
  devise_for :users
  resources :recursos

  resources :tropas

  # setear el root como el login de usuario
  devise_scope :user do
  root to: "devise/sessions#new"
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
