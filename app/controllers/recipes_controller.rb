class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.includes(:foods, :recipe_foods).find(params[:id])
    @foods_id_from_recipe = @recipe.foods.collect(&:id)
    @current_food_options = current_user.foods.collect do |f|
      ["#{f.name} / #{f.measurement_unit}", f.id] unless @recipe.foods.collect(&:id).include?(f.id)
    end.compact
    session[:current_recipe] = @recipe
    session[:current_food_options] = @current_food_options
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user, :recipe_foods).where('public = true').order(created_at: :desc)
  end

  def shopping_list
    @recipe_hash = session[:current_recipe]
    if @recipe_hash.nil?
      @foods_id_from_recipe = []
    else
      # rubocop:disable Style/OpenStructUse
      @r_object = OpenStruct.new(@recipe_hash)
      @recipe = Recipe.includes(:foods, :recipe_foods).find(@r_object.id)
      @foods_id_from_recipe = @recipe.foods.collect(&:id)
      @total_price = 0
      @recipe.recipe_foods.where(recipe_id: @recipe.id).each do |rf|
        price = (rf.food.price * rf.quantity).round(2)
        @total_price += price
      end
      # rubocop:enable Style/OpenStructUse
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
