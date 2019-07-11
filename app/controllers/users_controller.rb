class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  post '/signup' do #create
    if valid_username?(params[:username]) && valid_email?(params[:email]) && params[:password].length > 5
      @user = User.create(params)
      session[:user_id] = @user.id #automatically logs user in after signup
      redirect "/account/#{session[:user_id]}"
    else
      redirect '/failure'
    end
  end

  get '/account/:id' do
    @user = User.find(session[:user_id])
    @favorite_trails = UserTrails.all.select {|user_trail|user_trail.user_id == session[:user_id] && user_trail.favorite == "favorite"}
    @completed_trails = UserTrails.all.select {|user_trail|user_trail.user_id == session[:user_id] && user_trail.completed == "completed"}
    @trails = Trail.all
    erb :"/users/account"
  end

  post '/account/:id' do
    if !UserTrails.exists?(user_id: params[:id], trail_id: params[:trail_id])
      @user_trail = UserTrails.create(user_id: params[:id], trail_id: params[:trail_id], favorite: params[:favorite], completed: params[:completed])
    else
      UserTrails.where(user_id: params[:id], trail_id: params[:trail_id]).first.update(favorite: params[:favorite], completed: params[:completed])
    end
    redirect "/account/#{session[:user_id]}"
  end

  get '/login' do
    if !logged_in?
      erb :"/users/login"
    else
      redirect "/account/#{session[:user_id]}"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/account/#{session[:user_id]}"
    else
      redirect "/failure"
    end
  end

  get "/failure" do
    erb :"/users/failure"
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

  # edit
  get "/account/:id/edit" do
    @user = User.find(params[:id])
    erb :"/users/edit"
  end

  # update
  patch "/account/:id" do
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect to "/account/#{@user.id}"
  end

  # delete
  delete '/account/:id' do
    @user = User.find(params[:id])
    @user.delete
    redirect "/"
  end

end
