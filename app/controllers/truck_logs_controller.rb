class TruckLogsController < ApplicationController
  
    def create
        @log = TruckLog.new(truck_log_params)
        @log.geom = RGeo::Geographic.simple_mercator_factory.point(truck_log_params["longitude"], truck_log_params["latitude"])
        puts @log.inspect
        if @log.save
          render json: @log 
        else
          render json: @log.errors
        end
    end

    def truck_log_params
        params.require(:truck_log).permit(:truck_id, :latitude, :longitude)
    end
end

