'use strict';

$(function() {
  const thermostat = new Thermostat;

  thermostat.getTemperature();
  setTimeout(() => {
    updateTemperature();
  }, 50)

  updateWeather();

  function updateTemperature() {
    $('#temperature').text(thermostat.temperature);
    $('#temperature').attr('class', thermostat.energyUsage());
  }

  $('#up').on('click', function() {
    thermostat.up();
    updateTemperature();
    thermostat.postTemperature();
  });

  $('#down').on('click', function() {
    thermostat.down();
    updateTemperature();
    thermostat.postTemperature();
  });

  $('#psm-on').on('click', function() {
    thermostat.powerSavingOn();
    updateTemperature();
    thermostat.postTemperature();
    updatePSM();
  });

  $('#psm-off').on('click', function() {
    thermostat.powerSavingOff();
    updatePSM();
  });

  $('#reset').on('click', function() {
    thermostat.reset();
    updateTemperature();
    thermostat.postTemperature();
  });

  function updatePSM() {
    $('#psm-status').text(function() {
      if(thermostat.isPowerSavingMode) {
        return 'On';
      }
        return 'Off';
    });
  }

  $('#go').on('click', function() {
    updateWeather();
  });

  function updateWeather() {
    let url = 'http://api.openweathermap.org/data/2.5/weather?q='
    let city = $('#city').val()
    let token = '&APPID=d6215763932ba6dc5c6e90be8a1d2fed&units=metric'
    $.get(url + city + token, function(data) {
      $('#current-temperature').text(data.main.temp);
    });
  }
});
