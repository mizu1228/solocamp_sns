class GearsController < ApplicationController

  def index
    @gears = Gear.all.includes(:user)
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.valid?
      @gear.save
      redirect_to gears_path
    else
      render :new
    end
  end

  private

  def gear_params
    params.require(:gear).permit(
      :gear_name, :image, :explanation, :gear_genre_id, :tweet_id
    ).merge(user_id: current_user.id)
  end

end
