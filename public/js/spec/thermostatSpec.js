'use strict';

describe('Thermostat', function() {
  let thermostat

  beforeEach(function() {
    thermostat = new Thermostat();
  });

  describe('temperature', function() {
    it('starts at 20 degrees', function() {
      expect(thermostat.temperature).toBe(20)
    });
  });

  describe('up', function() {
    it('increases the temparature by 1', function() {
      thermostat.up()
      expect(thermostat.temperature).toBe(21)
    });
  });

  describe('down', function() {
    it ('decreases the temperature by 1', function() {
      thermostat.down()
      expect(thermostat.temperature).toBe(19)
    })

    it('throws error when at minimum temperature', function() {
      thermostat.temperature = 10
      expect(function() {thermostat.down();}).toThrow ('Minimum temperature reached');
    });
  });

  describe('isPowerSavingMode', function() {
    it ('starts with power saving mode on', function() {
      expect(thermostat.isPowerSavingMode).toBe(true)
    })

    it('sets maximum temperature to 25 when on', function() {
      thermostat.powerSavingOn()
      thermostat.temperature = 25
      expect(function() {thermostat.up();}).toThrow ('Maximum temperature reached');
    })

    it('sets maximum temperature to 32 when off', function() {
      thermostat.temperature = 32
      expect(function() { thermostat.up(); }).toThrow('Maximum temperature reached')
    });
  });

  describe('powerSavingOff', function() {
    it('sets power saving to false', function() {
      thermostat.powerSavingOff();
      expect(thermostat.isPowerSavingMode).toBe(false);
    });
  });


  describe('powerSavingOn', function() {
    it('sets power saving to true', function() {
      thermostat.powerSavingOff()
      expect(thermostat.isPowerSavingMode).toBe(false);

      thermostat.powerSavingOn()
      expect(thermostat.isPowerSavingMode).toBe(true)
    });

    it('reduces temperature to maximum if it is higher', function() {
      thermostat.temperature = 30
      thermostat.powerSavingOn()
      expect(thermostat.temperature).toBe(25)
    });
  });

  describe('reset', function() {
    it ('resets back to 20 degrees', function() {
      thermostat.up()
      thermostat.reset()
      expect(thermostat.temperature).toBe(20)
    })
  })

  describe('energyUsage', function() {
    it('returns low when temperature < 18', function() {
      thermostat.temperature = 17
      expect(thermostat.energyUsage()).toBe('low-usage')
    });

    it('returns high when temperature > 25', function() {
      thermostat.temperature = 26
      expect(thermostat.energyUsage()).toBe('high-usage')
    })

    it('returns medium when 18..25', function() {
      thermostat.temperature = 18
      expect(thermostat.energyUsage()).toBe('medium-usage')
    });
  });
});
