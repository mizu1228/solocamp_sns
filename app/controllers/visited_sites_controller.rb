class VisitedSitesController < ApplicationController

  def create
    VisitedSite.create(user_id: current_user.id, camp_site_id: params[:id])
    redirect_to root_path
  end

  def destroy
    VisitedSite.find_by(user_id: current_user.id, camp_site_id: params[:id]).destroy
    redirect_to root_path
  end
end
