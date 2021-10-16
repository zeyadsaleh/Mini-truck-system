class TrucksController < ApplicationController
  before_action :set_truck, only: [:truck_distance]

  def truck_distance
    # logs = @truck.truck_logs.where("created_at < ? AND created_at > ?", params[:from_date], params[:to_date])
    if params[:from_date].present? && params[:to_date].present?
      distance_sql = "SELECT ST_Length(ST_MakeLine(geom::geometry)::geography) as distance FROM truck_logs where created_at > '" + params[:from_date].to_time.to_s + "' AND created_at < '" + params[:to_date].to_time.to_s + "' AND truck_id = " +  @truck.id.to_s
      results = ActiveRecord::Base.connection.execute(distance_sql)
      render json: results.first["distance"]
    else
      render json: "Please enter valid inputs"
    end
  end


  def active_trucks
    render json: Truck.active_trucks.reverse
  end

  def truck_log
    render json: @truck.truck_logs.limit(150).reverse
  end

  private
  def set_truck      
    @truck = Truck.find(params[:id])
  end
end