class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:index, :create, :login]
    
    def index 
        render json: User.all
    end

    def create
        # create a user in the database
       
        user = User.create(
            name: params[:name], 
            email: params[:email],
            password: params[:password]
        )
    
        # validate the user
        if user.valid?
            # save user_id in session so we can use it in future requests
            session[:user_id] = user.id
            # return the user in the response
            render json: user, status: :created 
        else
            # for invalid users, send error messages to the front end
            render json: { message: user.errors.full_messages }, status: :bad_request
        end
    end
    
    def login
        
        # find the user by their username
        user = User.find_by(name: params[:name])
        
        # if the user exists and their password matches, log them in
        if user && user.authenticate(params[:password])
            # save user_id in session so we can use it in future requests
            session[:user_id] = user.id
            # return the user in the response
            render json: user
        else
            # for invalid username/password combos, send error messages to the front end
            render json: { message: "Invalid username or password" }, status: :unauthorized
        end
    end
    
        # before_action :authorized
        # @current_user
    def autologin
        
        # if we find the user, send back the user as the response
        user = User.find_by(id: session[:user_id])
        if user
           render json: user
        else
            render json: {message: "Not logged in"}, status: :unauthorized
        end
    end
    
        # before_action :authorized
    def profile
        
        # if we find the user, update the user
        @user.update(name: params[:name], email: params[:email])
        # send back the updated user as the response
        render json: @user    
    end
    
    def logout
        # to log the user out, remove their user_id from the session cookie
        session.delete(:user_id)
    
        # send some response to our frontend so we know the request succeeded
        render json: { message: "Logged Out" }
    end
    
end