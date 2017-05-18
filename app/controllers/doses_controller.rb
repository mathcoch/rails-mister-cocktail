class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = set_cocktail
    if @dose.save
      redirect_to cocktail_path(set_cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def set_cocktail
    Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
