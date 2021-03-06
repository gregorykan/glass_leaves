class Event < ActiveRecord::Base
  def self.stats
    self.all.map do |event|
      time = event.created_at.in_time_zone("Auckland")
      procedure = event.comment
      puts "#{time}: #{procedure}"
    end
  end
end