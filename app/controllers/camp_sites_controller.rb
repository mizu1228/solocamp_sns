class CampSitesController < ApplicationController
before_action :search_camp_site, only: [:index, :search, :show]
before_action :admin_judge, except: [:index, :search, :show]

  def index
    @prefectures = Prefecture.all
  end

  def new
    @camp_site = CampSite.new
  end

  def create
    @camp_site = CampSite.new(camp_site_params)
    if @camp_site.valid?
      @camp_site.save
      redirect_to camp_sites_path
    else
      render :new
    end
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

  def edit
    @camp_site = CampSite.find(params[:id])
  end

  def update
    @camp_site = CampSite.find(params[:id])
    @camp_site.update(camp_site_params)
    if @camp_site.save
      redirect_to camp_sites_path
    else
      render :edit
    end
  end

  def destroy
    camp_site = CampSite.find(params[:id])
    if camp_site.destroy
      redirect_to camp_sites_path
    else
      render :edit
    end
  end

  private

  def search_camp_site
    @p = CampSite.ransack(params[:q])
  end

  def camp_site_params
    params.require(:camp_site).permit(:site, :address, :site_tell, :prefecture_id, :site_type_id)
  end

  def admin_judge
    unless current_user.admin?
      redirect_to root_path
    end
  end

end
