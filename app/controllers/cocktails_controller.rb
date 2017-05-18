class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  before_action :set_cocktails

  def index
  end

  def show
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def search
    @cocktails = Cocktail.search(params[:search])
    render :search
  end

  private

  def cocktail_params
      params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_cocktails
    @cocktails = Cocktail.all
  end

end
