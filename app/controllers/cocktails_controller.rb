class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:edit, :show, :update, :destroy]
  def home
  end

  def index
    # @cocktails = Cocktail.all
    @cocktails = Cocktail.search(params[:search])
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

  def edit
  end

  def show
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :cocktail_id, :search)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
