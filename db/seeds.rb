# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(name: "John", email: "john@mail.com", password: "qwe123")
apple = user.foods.create(name: "apple", measurement_unit: "unit", price: 4)
wheat = user.foods.create(name: "wheat", measurement_unit: "kilo", price: 5)
user.save
recipe = Recipe.create(name: "apple pie", preparation_time: 30, cooking_time: 40, description: "lorem ipsum", public: true, user_id: 1)
recipe.recipe_foods.create(quantity: 6, food_id: 1)
recipe.recipe_foods.create(quantity: 1, food_id: 2)
recipe.save
