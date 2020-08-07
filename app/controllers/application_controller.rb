class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @new_recipe = Recipe.new(params)
    @new_recipe.save
    redirect to("/recipes/#{@new_recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id]) 
    erb :show
  end

  get '/recipes' do

    erb :index
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id]) 
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id]) 
    @recipe.update(params[:recipe])
    @recipe.save
    redirect to("/recipes/#{@recipe.id}")

  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id]) 
    @recipe.destroy
    redirect to("/recipes")
  end

end
