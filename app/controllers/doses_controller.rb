class DosesController < ActionController::Base
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # # @ingredients = Ingredient.all
    # @dose = Dose.new({cocktail_id: @cocktail.id})
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    @dose.save
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
