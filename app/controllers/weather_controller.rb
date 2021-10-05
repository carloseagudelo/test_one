class WeatherController < ApplicationController

  def index
    @weather = Weather.all
                &.by_order(params[:sort])
                &.by_date(params[:date])
                &.by_city(params[:city])         
    render json: @weather, status: :ok
  end

  def create
    @weather = Weather.new(weather_params)
    if @weather.save
      render json: @weather, status: :created
    else
      render json: { status: 400 }, status: :bad_request
    end
  end

  def show
    @weathers = Weather.where(id: params[:id])
    if @weathers.present?
      render json: @weathers.first, status: :ok
    else
      render status: :not_found
    end
  end

  def update
    render json: { status: 405 }, status: :method_not_allowed
  end
  
  def delete
    render json: { status: 405 }, status: :method_not_allowed
  end

  private

  def weather_params
    params.permit(:date, :lat, :lon, :city, :state, temperatures: [])
  end

end


