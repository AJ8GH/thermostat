class Thermostat {
  constructor() {
    this.DEFAULT_TEMPERATURE = 20
    this.MINIMUM_TEMPERATURE = 10;
    this.MAXIMUM_TEMPERATURE = 32;
    this.POWER_SAVING_MAX_TEMP = 25;
    this.LOW_ENERGY_LIMIT = 18;
    this.HIGH_ENERGY_LIMIT = 25;
    this.temperature = this.DEFAULT_TEMPERATURE;
    this.isPowerSavingMode = true;
  }

  up() {
    if(this._isMaximumtemperature()) {
      throw 'Maximum temperature reached';
    } else {
      return this.temperature += 1;
    };
  };

  down() {
    if (this._isMinimumTemperature()) {
      throw 'Minimum temperature reached';
    } else {
      return this.temperature -= 1;
    };
  };

  powerSavingOn() {
    this.temperature = 25;
    return this.isPowerSavingMode = true;
  };

  powerSavingOff() {
    return this.isPowerSavingMode = false;
  };

  reset() {
    return this.temperature = this.DEFAULT_TEMPERATURE;
  };

  energyUsage() {
    switch(true) {
      case(this.temperature < this.LOW_ENERGY_LIMIT):
        return 'low-usage';
      case(this.temperature > this.HIGH_ENERGY_LIMIT):
        return 'high-usage';
      default:
        return 'medium-usage';
    };
  };

  _isMaximumtemperature() {
    if(this.isPowerSavingMode) {
      return this.temperature >= this.POWER_SAVING_MAX_TEMP;
    };
    return this.temperature >= this.MAXIMUM_TEMPERATURE;
  };

  _isMinimumTemperature() {
    return this.temperature === this.MINIMUM_TEMPERATURE;
  };
};
