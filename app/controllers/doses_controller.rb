class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # raise
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    # raise
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy #DELETE
    # raise
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
