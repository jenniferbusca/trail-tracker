class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  post '/signup' do
    if params[:username].length < 1 || params[:email].length < 1 || params[:password].length < 1
      redirect '/failure'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :location => params[:location])
      session[:user_id] = @user.id #automatically logs user in after signup
      redirect "/account"
    end
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :"/users/account"
  end

  get '/login' do
    if !logged_in?
      erb :"/users/login"
    else
      redirect "/account"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/account"
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

end
