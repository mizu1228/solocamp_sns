class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]
  before_action :user_judge, only: [:show, :edit, :update, :destroy]

  def index
    @gears = Gear.all.includes(:user)
    @genres = GearGenre.where.not(id: 0)
  end

  def new
    @gear = GearsMaker.new
  end

  def create
    @gear = GearsMaker.new(gear_params)
    maker_list = params[:gear][:maker_name].split(",")
    if @gear.valid?
      @gear.save(maker_list)
      redirect_to gears_path
    else
      render :new
    end
  end

  def show
  end

  def genre_show
    @genre = GearGenre.find(params[:id])
  end

  def search
    return nil if params[:keyword] == ""
    maker = Maker.where(['maker_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: maker }
  end

  def edit_search
    return nil if params[:keyword] == ""
    maker = Maker.where(['maker_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: maker }
  end

  def edit
    @gears_maker = GearsMaker.new(gear: @gear)
  end

  def update
    @gears_maker = GearsMaker.new(gear_params, gear: @gear)
    maker_list = params[:gear][:maker_name].split(",")
    if @gears_maker.image == nil
      @gears_maker.image = @gear.image.blob
    end
    if @gears_maker.valid?
      @gears_maker.save(maker_list)
      redirect_to gear_path(@gear)
    else
      render :edit
    end
  end

  def destroy
    if @gear.destroy
      redirect_to gears_path
    else
      render :edit
    end
  end

  private

  def gear_params
    params.require(:gear).permit(
      :gear_name, :image, :explanation, :gear_genre_id, :tweet_id, :maker_name
    ).merge(user_id: current_user.id)
  end

  def user_judge
    if current_user.id != @gear.user_id
      redirect_to gears_path
    end
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end

end
