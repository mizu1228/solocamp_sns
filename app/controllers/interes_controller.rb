class InteresController < ApplicationController
  before_action :camp_site_params, only: [:create, :destroy]

  def index
    @interes = Intere.all.includes(:user)
  end

  def create
    Intere.create(user_id: current_user.id, camp_site_id: params[:id])
  end

  def destroy
    Intere.find_by(user_id: current_user.id, camp_site_id: params[:id]).destroy
  end

  private

  def camp_site_params
    @site = CampSite.find(params[:id])
  end
end
