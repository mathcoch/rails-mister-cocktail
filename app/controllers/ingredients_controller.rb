class IngredientsController < ApplicationController
  def search
    @cocktails = Cocktail.all
    @ingredients = Ingredient.search(params[:search])
  end
end
