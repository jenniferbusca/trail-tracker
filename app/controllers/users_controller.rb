class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  post '/signup' do #create
    if valid_username?(params[:username]) && valid_email?(params[:email]) && params[:password].length > 5
      @user = User.create(params)
      session[:user_id] = @user.id #automatically logs user in after signup
      redirect "/user/#{session[:user_id]}"
    else
    erb :'users/failure', locals: {message: "Make sure your username and email aren't already registered and that your password 5 characters or more."}
    end
  end

  get '/user/:id' do
    @user = User.find(session[:user_id])
    erb :"/users/user"
  end

  post '/user/:id' do
    if !UserTrail.exists?(user_id: params[:id], trail_id: params[:trail_id])
      @user_trail = UserTrail.create(user_id: params[:id], trail_id: params[:trail_id], favorite: params[:favorite], completed: params[:completed])
    else
      UserTrail.where(user_id: params[:id], trail_id: params[:trail_id]).first.update(favorite: params[:favorite], completed: params[:completed])
    end
    redirect "/user/#{session[:user_id]}"
  end

  get '/login' do
    if !logged_in?
      erb :"/users/login"
    else
      redirect "/user/#{session[:user_id]}"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/user/#{session[:user_id]}"
    else
      erb :'users/failure', locals: {message: "Your username or password are incorrect."}
    end
  end

  # get "/failure" do
  #   erb :"/users/failure"
  # end

  get '/logout' do
    session.destroy
    redirect '/'
  end

  # edit
  get "/user/:id/edit" do
    @user = User.find(params[:id])
    erb :"/users/edit"
  end

  # update
  patch "/user/:id" do
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect to "/user/#{@user.id}"
  end

  # delete
  delete '/user/:id' do
    @user = User.find(params[:id])
    @user.destroy
    redirect "/logout"
  end

end
