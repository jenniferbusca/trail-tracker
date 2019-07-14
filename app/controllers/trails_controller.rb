class TrailsController < ApplicationController

  get "/trails" do
    @trails = Trail.all
    erb :"/trails/index"
  end

  # GET: /posts/new
  get "/trails/new" do
    if logged_in?
      erb :'trails/new'
    else
      redirect '/'
    end
  end

  # POST: /trails
  post "/trails" do
    unless params[:trail][:name].blank? || params[:trail][:location].blank?
      searched_trail = Trail.find_by name: params[:trail][:name], location: params[:trail][:location]
      if searched_trail == nil
        @trail = Trail.create(params[:trail])
        redirect "/trails/#{@trail.id}"
      else
        erb :'users/failure', locals: {message: "This trail already exists."}
      end
    else
      erb :'users/failure', locals: {message: "Trail name and location required."}
    end
  end

  # GET /trails/:id
  get "/trails/:id" do
    @user_id = session[:user_id]
    @trail = Trail.find(params[:id])
    @user_trail = UserTrail.where(user_id: @user_id, trail_id: params[:id]).first
    erb :"/trails/show"
  end

  # GET /trails/:id/edit
  get "/trails/:id/edit" do
    @trail = Trail.find(params[:id])
    erb :"/trails/edit"
  end

  # PATCH: /trails/:id
  patch "/trails/:id" do
    @trail = Trail.find(params[:id])
    @trail.update_attributes(params[:trail])
    redirect to "/trails/#{@trail.id}" #double check this
  end

  # delete
  delete '/trails/:id' do
    @trail = Trail.find(params[:id])
    @trail.destroy
    redirect "/trails"
  end

end
