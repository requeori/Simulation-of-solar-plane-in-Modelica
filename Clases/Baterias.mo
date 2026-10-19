class Baterias
  parameter Real E_max = 7200000.0 "Capacidad máxima en Joules (2000 Wh)";
  parameter Real E_start = 3600000.0 "Energía inicial (J)";
  parameter Real eta_charge = 0.95 "Rendimiento de carga";
  parameter Real eta_discharge = 0.95 "Rendimiento de descarga";
  
  input Real P_in "Potencia proveniente del panel solar (W)";
  input Real P_out "Potencia consumida por el motor (W)";
  
  output Real E_bat(start=E_start, fixed=true) "Energía almacenada (J)";
  output Real SoC "Estado de carga (%)";
  
  Real P_net "Flujo neto de potencia (W)";
equation
  // Balance de potencia considerando eficiencias de carga y descarga
  P_net = P_in * eta_charge - P_out / eta_discharge;
  
  // Ecuación diferencial de la energía acumulada
  der(E_bat) = P_net;
  
  // Porcentaje del Estado de Carga (SoC)
  SoC = (E_bat / E_max) * 100.0;
end Baterias;
