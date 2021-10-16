require 'sidekiq-scheduler'
class TruckReportWorker 
  include Sidekiq::Worker

  def perform(*args)
    distance_sql = "SELECT truck_id, ST_Length(ST_MakeLine(geom::geometry)::geography) as distance, (COUNT(*) * 0.5) as active_time_in_minutes, ((COUNT(*) * 0.5 / 60)) as active_time_in_hours FROM truck_logs WHERE created_at >(SELECT NOW() - INTERVAL '1 DAY') GROUP by truck_id"   #since the truck logs every 30 seconds so the active time in minutes of the truck is truck log records count * 0.5 :)
    trucks_daily_report = ActiveRecord::Base.connection.execute(distance_sql).to_a #use this to build the report 
    puts trucks_daily_report
    return trucks_daily_report
  end
end
