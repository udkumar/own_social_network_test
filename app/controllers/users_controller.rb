class UsersController < ApplicationController

  # 1. As a user, I need an API to create a friend connection between two email
  # addresses.
  def create_friend
    if params[:friends]
      friends = params[:friends]
      i = 0 
      friends.each do |email|
        user = User.find_by(email: email)
        if i == 0 
          user.friends.create(email: friends[1])
          i += 1
        else
            user.friends.create(email: friends[0])
        end
      end
      render json: {success: true}
    else
      render json: {success: false, message: "params missing or not in correct format!"}
    end
  end

  # 2. As a user, I need an API to retrieve the friends list for an email address.
  def all_friends
    if params[:email]
      user = User.find_by(email: params[:email])
      @friends = user.friends.pluck('email')
      if @friends
        render json: {success: true, friends: @friends, count: @friends.length}
      else
        render json: {success: false, message: "User does not have any friends!"}
      end
    else
      render json: {success: false, message: "params missing or not in correct format!"}
    end
      
  end

  # 3. As a user, I need an API to retrieve the common friends list between two
  # email addresses.
  def common_friends
    if params[:friends]
      users = params[:friends]
      friend_emails = []
      users.each do |u|
          user = User.find_by(email: u)
          emails = user.friends.pluck('email')
          emails.each {|e| friend_emails.push(e)}
      end
      friend_emails = friend_emails.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
      common_friends = friend_emails.map{|k,v| k if v >= 2}.compact
      if (common_friends.length > 0)
        render json: {success: true, friends: common_friends, count: common_friends.length}
      else
        render json: {success: true, friends: common_friends, count: common_friends.length, message: "Comman friend is not available!"}
      end
    else
      render json: {success: false, message: "params missing or not in correct format!"}
    end
  end

  # 4. As a user, I need an API to subscribe to updates from an email address.
  def subscribe
    if (params[:requestor] && params[:target])
      user = User.find_by(email: params[:requestor])
      if user.present?
        subscribe = Subscribe.find_by(email: params[:target])
        if  !subscribe
            subscribe = Subscribe.new(email: params[:target])
            subscribe.save
        end
        existing_subscription = user.subscribe_blocks.find_by(user_id: user.id, subscribe_id: subscribe.id)
        if  (!existing_subscription)
            user.subscribe_blocks.create(subscribe: subscribe)
            render json: {success: true}
        else
            render json: {success: false, message: "Subscription already exist!"}
        end
      else
        render json: {success: false, message: "requestor doesn't exist!"}
      end
    else
      render json: {success: false, message: "params invalid or not present!"}
    end
  end

  # 5. As a user, I need an API to block updates from an email address.
  def block
    if (params[:requestor] && params[:target])
      user = User.find_by(email: params[:requestor])
      if user.present?
        target = Subscribe.find_by(email: params[:target])
        if target.present?
          s_block = user.subscribe_blocks.find_by_subscribe_id(target.id)
          s_block.is_block = true
          if s_block.save
            render json: {success: true}
          else
            render json: {success: false, message: "Something went Wrong!"}
          end
        else
            render json: {success: false, message: "target doesn't exist!"}
        end
      else
        render json: {success: false, message: "requestor doesn't exist!"}
      end
    else
      render json: {success: false, message: "params target or requestor not present or params not in correct format!"}  
    end
  end

  # 6. As a user, I need an API to retrieve all email addresses that can receive
  # updates from an email address.
  def receive_update
    if params[:sender]
      subscribe = Subscribe.find_by(email: params[:sender])
      if subscribe.present?
        test = params[:text]
        user = User.find_by(email: params[:sender])
        subscribe_users = subscribe.users
        receipients = []
        test.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i) { |x| receipients.push(x) }
        if subscribe_users.present?
          subscribe_users.each do |u|
              subscribe_block =  SubscribeBlock.find_by(subscribe_id: subscribe.id, user_id: u.id)
              if (subscribe_block && !subscribe_block.is_block) 
                  receipients.push(u.email)
              end
          end
        end
        if (receipients.length > 0)
          render json: {sucess: true, receipients: receipients}
        else
          render json: {sucess: true, receipients: receipients, message: "receipient not found!"}
        end
      else
        render json: {sucess: false, message: "sender not found!"}
      end
    else
       render json: {success: false, message: "Something Missing!"}  
    end
  end

end
