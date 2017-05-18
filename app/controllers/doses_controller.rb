class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)
    ingredient = Ingredient.find_by_name(params[:ingredient_name])
    @dose.ingredient = ingredient
    @dose.cocktail = current_cocktail

    if @dose.save
      redirect_to cocktail_path(current_cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy

  end

  private

  def current_cocktail
    Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
