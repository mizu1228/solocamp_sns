class CampSitesController < ApplicationController
  def index
    @prefectures = Prefecture.where.not(name: "--" )
  end
  
  def show
  end
end
