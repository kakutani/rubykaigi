ActionController::Routing::Routes.draw do |map|
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.lightning_talk_submissions("/:year/:locale/lightning_talk_submissions/:action",
    :controller => 'lightning_talk_submissions', :action => 'index',
    :requirements => {:year => /2\d{3}/, :locale => /en|ja/ })

  map.registrations("/:year/:locale/registrations/:action",
    :controller => 'registrations', :action => 'index',
    :requirements => {:year => /2\d{3}/, :locale => /en|ja/ })

  map.paypal("/paypal/:action",
    :controller => 'paypal', :action => 'index')

  map.with_options( :controller => "public_releases", :action => "show",
                    :defaults => {:page_name => "index"} ) do |pr|
    pr.pub_release ":year/:locale/:page_name", :requirements => {:year => /2\d{3}/, :locale => /en|ja/ }
    pr.connect     ":year/:page_name", :requirements => {:year => /2\d{3}/}
 end

  map.with_options(:controller => 'exchange_tickets') do |tickets|
    tickets.show_exchange_ticket("/exchange_tickets/show/:code4u",
      :action => "show",
      :requirements => {:code4u => /\w{24}/})
    tickets.reissue_exchange_tickets("/exchange_tickets/reissue",
      :action => "reissue",
      :conditions => {:method => :post})
    tickets.connect "/exchange_tickets/:action", :defaults => {:action => 'index'}
  end

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  map.signin '/signin', :controller => 'sessions', :action => 'new'
  map.signout '/signout', :controller => 'sessions', :action => 'destroy', :method => :post

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products
  map.resources :sessions
  map.resources :accounts

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
