class Irradiancia
  parameter Real G_max = 1000.0 "Irradiancia pico al mediodía (W/m^2)";
  parameter Real t_sunrise = 21600.0 "Hora de amanecer en segundos (6:00 AM)";
  parameter Real t_sunset = 64800.0 "Hora de atardecer en segundos (18:00 PM)";
  output Real G "Irradiancia solar (W/m^2)";
  output Real T_amb "Temperatura ambiente (°C)";
equation
  // Modelo de irradiancia diurna mediante media onda senoidal
    G = if (time >= t_sunrise and time <= t_sunset) then G_max * sin((time - t_sunrise) / (t_sunset - t_sunrise) * Modelica.Constants.pi) else 0.0;
    T_amb = 20.0;  // Se puede sustituir más adelante por un modelo según altitud
end Irradiancia;
