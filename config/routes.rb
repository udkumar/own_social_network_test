Rails.application.routes.draw do
  # devise_for :users
  root to: 'home#front'

  namespace :api , defaults: { format: :json } do
    resources :users, only: [] do
      collection do
        #1.As a user, I need an API to create a friend connection between two email addresses.
        post :create_friend  
        #2. As a user, I need an API to retrieve the friends list for an email address.
        post :all_friends
        #3. As a user, I need an API to retrieve the common friends list between two
        # email addresses
        post :common_friends
        # 4. As a user, I need an API to subscribe to updates from an email address.
        post :subscribe
        # 5. As a user, I need an API to block updates from an email address.
        post :block
        # 6. As a user, I need an API to retrieve all email addresses that can receive
        # updates from an email address.
        post :receive_update
      end
    end
  end

  get "*path", to: redirect('/')
end