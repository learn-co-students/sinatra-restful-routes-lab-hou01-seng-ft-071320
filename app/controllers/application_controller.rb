class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.find_or_create_by(name: params[:name],ingredients: params[:ingredients],cook_time: params[:cook_time])
    redirect to("/recipes/#{@recipe.id}")
   end
 
   get '/recipes/:id' do
     @recipe = Recipe.find_by(id: params[:id])
     if @recipe.nil?
       redirect to ('/recipes')
     else
       erb :show
     end
   end
 
   get '/recipes/:id/edit' do
     @recipe = Recipe.find_by(id: params[:id])
     if @recipe.nil?
       redirect to ('/recipes')
     else
       erb :edit
     end
   end
 
   patch '/recipes/:id' do
     @recipe = Recipe.find_by(id: params[:id])
     @recipe.update(name: params[:name],ingredients: params[:ingredients],cook_time: params[:cook_time])
     redirect to("/recipes/#{@recipe.id}")
   end
 
   delete '/recipes/:id' do
     @recipe = Recipe.find_by(id: params[:id])
     if @recipe.nil?
       redirect to ('/recipes')
     else
       @recipe.destroy
       redirect to('/recipes')
     end
   end

end
