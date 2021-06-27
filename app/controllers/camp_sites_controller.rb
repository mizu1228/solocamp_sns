class CampSitesController < ApplicationController
before_action :search_camp_site, only: [:index, :search, :show]

  def index
    @prefectures = Prefecture.all
  end

  def new
    @camp_site = CampSite.new
  end

  def search
    @results = @p.result
    @results.each do |result|
      @result = result
    end
  end

  def show
    @result = @p.result.find(params[:camp_site_id])
  end

  private

  def search_camp_site
    @p = CampSite.ransack(params[:q])
  end

  def camp_site_params
    params.require(:camp_site).permit(:site, :address, :site_tell, :prefecture_id, :site_type_id)
  end

end
