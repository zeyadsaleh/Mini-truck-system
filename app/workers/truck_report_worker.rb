require 'sidekiq-scheduler'
class TruckReportWorker
  include Sidekiq::Worker

  def perform(*args)
    distance_sql = "SELECT truck_id, ST_Length(ST_MakeLine(geom::geometry)::geography) as distance FROM truck_logs WHERE created_at >'" + 1.days.ago.to_s + "' GROUP by truck_id"
    total_distance_travelled = ActiveRecord::Base.connection.execute(distance_sql)
  end
end
