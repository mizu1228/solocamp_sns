class CampSitesController < ApplicationController
before_action :search_camp_site, only: [:index, :search, :show]

  def index
    @prefectures = Prefecture.all
    # @camp_sites = CampSite.all
    if session[:image] != nil || session[:text] != nil || session[:tweets_tag] != nil
      session[:image] = params[:tweet][:image]
      session[:text] = params[:tweet][:text]
      session[:tweets_tag] = params[:tweet][:tweets_tag]
    end
  end

  def search
    @results = @p.result
    @results.each do |result|
      @result = result
    end

    if session[:image] != nil || session[:text] != nil || session[:tweets_tag] != nil
      session[:image] = params[:tweet][:image]
      session[:text] = params[:tweet][:text]
      session[:tweets_tag] = params[:tweet][:tweets_tag]
    end
  end

  def show
    @result = @p.result.find(params[:camp_site_id])
  end

  private

  def search_camp_site
    @p = CampSite.ransack(params[:q])
  end

end
