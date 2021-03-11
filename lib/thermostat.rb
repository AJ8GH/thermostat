class Thermostat
  DEFAULT_TEMPERATURE = 20

  attr_reader :temperature

  def self.instance
    @instance ||= new
  end

  def initialize
    @temperature = DEFAULT_TEMPERATURE
  end

  def up
    self.temperature += 1
  end

  def down
    self.temperature -= 1
  end

  private

  attr_writer :temperature
end
