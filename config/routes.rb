Rails.application.routes.draw do
  #users
  devise_for :users, skip: %i[registrations sessions passwords]

  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

  scope path: "/api" do
    resources :model_pages

    resources :documents do
      collection do
        post 'search', to: 'documents#search'
        post 'search_in_web', to: 'documents#search_in_web'
        post 'search_in_web_by_person', to: 'documents#search_in_web_by_person'
        get 'details_by_smart_contract/:address', to: 'documents#details_by_smart_contract'
      end
    end

    resources :page_control_types
    resources :family_commissaries

    resources :control_pages do
      collection do
        get 'get_page_controls/:address', to: 'control_pages#get_page_controls'
        post '/get_document', to: 'control_pages#get_document'
        post '/get_document_folder', to: 'control_pages#get_document_folder'
      end
    end

    scope path: "/complaint_participants" do
      get ':address', to: 'complaint_participants#index'
      post '', to: 'complaint_participants#create'
      put ':id', to: 'complaint_participants#update'
      delete ':id', to: 'complaint_participants#destroy'
    end

    scope path: "/workflows" do
      get 'workflow_histories/:address', to: 'work_flow#get_workflow_histories'
      get 'get_steps/:address', to: 'work_flow#get_steps'
    end

    scope path: "/health_promoting_entity" do
      get '', to: 'health_promoting_entity#index'
    end

    scope path: "/document_types" do
      get '', to: 'document_type#index'
      get 'list_for_search', to: 'document_type#list_for_search'
    end

    scope path: "/person_types" do
      get '', to: 'person_type#index'
    end

    scope path: "/steps" do
      get '', to: 'steps#index'
    end

    scope path: "/relationship_types" do
      get '', to: 'relationship_type#index'
    end
    
    scope path: "/users" do
      get 'get_sidebar', to: 'user#sidebar'
      get 'get_ether_account', to: 'user#get_ether_account'
      get 'get_user_group_by_roles', to: 'user#get_user_group_by_roles'
      get 'get_all_user', to: 'user#get_all_user'
      get 'get_user_roles', to: 'user#get_user_roles'
      get 'get_profile/:user_id', to: 'user#get_profile'
      get 'get_account', to: 'user#get_account'
      put 'edit_profile/:user_id', to: 'user#edit_profile'
      post 'update_password', to: 'user#update_password'
      put 'enable_user', to: 'user#enable_user'
    end
  end

end
