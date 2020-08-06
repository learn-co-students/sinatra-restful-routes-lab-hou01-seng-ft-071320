Recipe.destroy_all

4.times do 
    name = Faker::Food.dish
    ingredients = Faker::Food.ingredient
    cook_time = rand(1..10).to_s

    Recipe.create(name: name, ingredients: ingredients, cook_time: cook_time)
end