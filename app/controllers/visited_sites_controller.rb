class VisitedSitesController < ApplicationController
  before_action :camp_site_params

  def create
    VisitedSite.create(user_id: current_user.id, camp_site_id: params[:id])
  end

  def destroy
    VisitedSite.find_by(user_id: current_user.id, camp_site_id: params[:id]).destroy
  end

  private

  def camp_site_params
    @site = CampSite.find(params[:id])
  end
end
