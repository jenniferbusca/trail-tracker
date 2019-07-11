require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if !logged_in?
      erb :index
    else
      redirect "/user/#{session[:user_id]}"
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def valid_email?(email)
      if email.length < 5 || User.exists?(:email => params[:email]) || !email.include?("@")
        false
      else
        true
      end
    end

    def valid_username?(username)
      if username.length < 3 || User.exists?(:username => params[:username])
        false
      else
        true
      end
    end

  end
end
