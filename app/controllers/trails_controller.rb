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
    @trail = Trail.create(params[:trail])
    redirect "/trails/#{@trail.id}"
  end

  # GET /trails/:id
  get "/trails/:id" do
    @trail = Trail.find(params[:id])
    erb :"/trails/show"
  end

end
