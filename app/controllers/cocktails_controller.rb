class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    @cocktail.save
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
