require 'rails_helper'

RSpec.describe 'Recipe index', type: :system do
  describe 'Check the content' do
    before(:example) do
      @user = User.new(name: "John", email: "john@mail.com", password: "qwe123")
      @user.save
      @recipe = Recipe.new(name: "apple pie", preparation_time: 30, cooking_time: 40, description: "lorem ipsum", public: true, user_id: @user.id)
      @recipe.save
      @user2 = User.create(name: "Maria", email: "maria@mail.com", password: "qwe123")
      @user2.save
      @recipe2 = Recipe.new(name: "apple candy", preparation_time: 10, cooking_time: 10, description: "candy", public: false, user_id: @user2.id)
      @recipe2.save
      visit root_path
      sleep(2)
      fill_in 'user_email', with: 'john@mail.com'
      fill_in 'user_password', with: 'qwe123'
      click_button 'Log in'
      sleep(1)
      visit recipes_path
      sleep(1)
    end
    it 'of the titles page index' do
      expect(page).to have_content('Your recipes')
    end
    it 'of one of users recipe' do
      expect(page).to have_content('apple pie')
    end
    it 'isnt showing other users recipe' do
      expect(page).to_not have_content('apple candy')
    end
  end
end
