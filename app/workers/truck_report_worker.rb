require 'sidekiq-scheduler'
class TruckReportWorker
  include Sidekiq::Worker

  def perform(*args)
    distance_sql = "SELECT truck_id, ST_Length(ST_MakeLine(geom::geometry)::geography) as distance, (COUNT(*) * 0.5) as active_time_in_minutes, FROM truck_logs WHERE created_at >'" + 1.days.ago.to_s + "' GROUP by truck_id"
    trucks_daily_report = ActiveRecord::Base.connection.execute(distance_sql)
  end
end
