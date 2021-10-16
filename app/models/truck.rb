class Truck < ApplicationRecord
    has_many :truck_logs

    scope :active_trucks, -> {
        joins(:truck_logs).where("truck_logs.created_at < ?", 5.minutes.ago).distinct
    }
    
end
