class GearsController < ApplicationController

  def index
    @gears = Gear.all.includes(:user)
    @genres = GearGenre.where.not(id: 0)
  end

  def new
    @gear = GearsMaker.new
  end

  def create
    @gear = GearsMaker.new(gear_params)
    if @gear.valid?
      @gear.save
      redirect_to gears_path
    else
      render :new
    end
  end

  def show
    @gear = Gear.find(params[:id])
  end

  def genre_show
    @genre = GearGenre.find(params[:id])
  end

  private

  def gear_params
    params.require(:gears_maker).permit(
      :gear_name, :image, :explanation, :gear_genre_id, :tweet_id, :maker_name
    ).merge(user_id: current_user.id)
  end

end
