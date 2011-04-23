IHireApplicant::Application.routes.draw do |map|
  get "login/Start"

  get "personal_information/get_info"
  
  resources :general_questions, :addresses
  resources :general_answers, :position_specific_answers, :people
  
  namespace "admin" do 
      resources :general_questions, :position_specific_questions
      resources :positions
  end
  
  
  
  #match 'Admin::Questions' => 'Admin::Questions#index'
  #match 'questions/:id' => 'Admin::Questions#show'
  #match 'questions/:id/:action' => 'Admin::Questions#edit'
  #match 'questions/new' => 'Admin::Questions#new'
  #match 'questions/:action' => 'Admin::Questions'
  
  match "positions_admin" => "positions_admin#index"
  
  get "job_questions/index"

  get "job_questions/results"    
  match "/positions_search/index" => "positions_search#index"
  get "positions_search/index"
  
  get "positions_search/results"

  get "positions_search/detail"
  
  get "questions_admin/index"

  match "positions_search" => "positions_search#index"
  
  get "login/start"
  match "/login/start" => "login#start"
  
  #application navigation controller
  match "/job_applications/index" => "job_applications#index"
  
  match "/job_applications/next" => "job_applications#next"
  
  match "/job_applications/complete" => "job_applications#complete"
  
  #match "questions/new" => "Admin::Questions#new"
  #match "questions/:id" => "Admin::Questions#show"
  #match "questions/:id/edit" => "Admin::Questions#edit"
  #scaffolding for questions
  
  #match "Admin::Questions/create" => "questions#create"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => "Home#Start"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
