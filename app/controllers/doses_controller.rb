class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    if @dose.save
      redirect_to @cocktails
    else
      render :new
    end
  end

  private

  def doses_params
    params.require(:cocktail).permit(:description)
  end
end
