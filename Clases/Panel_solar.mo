class Panel_solar
parameter Real area = 8.0 "Área total de paneles (m^2)";
  parameter Real eta_ref = 0.22 "Eficiencia nominal a 25 °C";
  parameter Real gamma = -0.004 "Coeficiente térmico de pérdida (1/°C)";
  
  input Real G "Irradiancia de entrada (W/m^2)";
  input Real T_amb "Temperatura ambiente de entrada (°C)";
  output Real P_panel "Potencia generada (W)";
  
  Real T_panel "Temperatura instantánea del panel (°C)";
  Real eta_panel "Eficiencia instantánea";
equation
  // Estimación de la temperatura del panel por exposición solar
  T_panel = T_amb + 0.03 * G;
  
  // Rendimiento térmico según la temperatura
  eta_panel = eta_ref * (1 + gamma * (T_panel - 25.0));
  
  // Potencia eléctrica producida
  P_panel = area * G * eta_panel;
end Panel_solar;
