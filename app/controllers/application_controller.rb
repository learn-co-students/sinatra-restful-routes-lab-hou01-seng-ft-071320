class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  # code actions here!

  get "/" do
    redirect to "/recipes"
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end
  
  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do
    if Recipe.all.find_by(id: params[:id]).nil?
      redirect to "/recipes"
    else
      @recipe = Recipe.all.find_by(id: params[:id])
      erb :show
    end
  end

  get "/recipes/:id/edit" do
    if Recipe.all.find_by(id: params[:id]).nil?
      redirect to "/recipes"
    else
      @recipe = Recipe.all.find_by(id: params[:id])
      erb :edit
    end
  end

  patch "/recipes/:id" do
    @recipe = Recipe.all.find_by(id: params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.all.destroy(params[:id])
    redirect to "/recipes"
  end





end
