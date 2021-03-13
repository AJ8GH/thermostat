class Thermostat
  DEFAULT_TEMPERATURE = 20

  attr_reader :temperature, :psm, :city

  class << self
    def instance
      @instance ||= new
    end

    def renew
      @instance = new
    end
  end

  def initialize
    @temperature = DEFAULT_TEMPERATURE
    @psm = 'On'
    @city = 'London'
  end

  def update_settings(temperature:, city:, psm:)
    self.temperature = temperature
    self.city = city
    self.psm = psm
  end

  private

  attr_writer :temperature, :psm, :city
end
