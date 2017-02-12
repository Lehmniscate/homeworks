class Route < ActiveRecord::Base
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    d = Driver.select(:name, 'buses.id').joins(bus: :route).where(routes: { id: id})

    all_drivers = Hash.new{|h,k| h[k] = []}
    d.each do |driver|
      all_drivers[driver.id] << driver.name
    end
    all_drivers
  end
end
