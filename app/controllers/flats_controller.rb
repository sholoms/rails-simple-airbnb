class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit destroy update]
  def index
    @flats = Flat.all
    @flats = @flats.select { |flat| flat.name.downcase.include? params[:search].downcase } if params[:search]
  end

  def show() end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save ? (redirect_to @flat) : (render :new)
  end

  def edit() end

  def update
    @flat.update(flat_params) ? (redirect_to flat_path(@flat)) : (render :edit)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
