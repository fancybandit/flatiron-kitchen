class RecipesController < ApplicationController

    def show
        find_recipe
    end
    
    def new
        @recipe = Recipe.new
    end

    def create
        recipe = Recipe.new(recipe_params)
        if recipe.save
            redirect_to recipe_path(recipe)
        else
            render "new"
        end
    end

    def edit
        find_recipe
    end

    def update
        find_recipe
        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render "edit"
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[], ingredient_attributes: [:name])
    end

    def find_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end

end