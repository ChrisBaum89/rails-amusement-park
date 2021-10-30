class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @admin = admin?
  end

  def show
    @user = current_user
    @admin = admin?
    @attraction = Attraction.find_by_id(params[:id])
    if not admin?
      @ride = Ride.new
      @ride.user_id = @user.id
      @ride.attraction_id = @attraction.id
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    attraction = Attraction.find_by_id(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
