require 'rails_helper'

RSpec.describe 'Recipe index', type: :system do
  describe 'Check the content' do
    before(:example) do
      @user = User.new(name: 'John', email: 'john@mail.com', password: 'qwe123')
      @user.save
      @apple = @user.foods.new(name: 'apple', measurement_unit: 'unit', price: 4)
      @apple.save
      @wheat = @user.foods.new(name: 'wheat', measurement_unit: 'gram', price: 0.5)
      @wheat.save
      @sugar = @user.foods.new(name: 'sugar', measurement_unit: 'gram', price: 0.2)
      @sugar.save
      @recipe = Recipe.new(name: 'apple pie', preparation_time: 30, cooking_time: 40, description: 'lorem ipsum',
                           public: true, user_id: @user.id)
      @recipe.save
      @recipe.recipe_foods.new(quantity: 6, food_id: @apple.id)
      @recipe.save
      @recipe.recipe_foods.new(quantity: 200, food_id: @wheat.id)
      @recipe.save
      visit root_path
      sleep(2)
      fill_in 'user_email', with: 'john@mail.com'
      fill_in 'user_password', with: 'qwe123'
      click_button 'Log in'
      sleep(1)
      visit recipe_path(@recipe.id)
      sleep(1)
    end
    it 'of recipes name and description' do
      expect(page).to have_content('apple pie')
      expect(page).to have_content('lorem ipsum')
    end
    it 'of one food from recipe' do
      expect(page).to have_content('wheat')
    end
    it 'add sugar to the recipe' do
      click_button 'Add new ingredient'
      sleep(1)
      expect(page).to have_content('sugar')
      fill_in 'recipe_food_quantity', with: '200'
      click_button 'Add food to the recipe'
      sleep(1)
      expect(page).to have_content('sugar')
    end
  end
end
