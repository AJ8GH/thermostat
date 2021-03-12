class Thermostat
  DEFAULT_TEMPERATURE = 20

  attr_reader :temperature

  def self.instance
    @instance ||= new
  end

  def initialize
    @temperature = DEFAULT_TEMPERATURE
  end

  def update_temperature(new_temperature)
    self.temperature = new_temperature
  end

  private

  attr_writer :temperature
end
