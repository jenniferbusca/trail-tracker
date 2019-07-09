class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   erb :'/users/show'
  # end

  get '/signup' do
    if !logged_in?
      erb :'users/new', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/users/show'
    end
  end

  post '/signup' do
    if params[:username].length < 1 || params[:email].length < 1 || params[:password].length < 1
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :location => params[:location])
      session[:user_id] = @user.id
      redirect to '/users/show'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/users/show'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/users/show"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
