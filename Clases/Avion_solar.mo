model Avion_solar
// Instancia de cada uno de los subsistemas / modelos
  Irrandiancia irra;
  Panel_solar panel(area = 8.0, eta_ref = 0.22);
  Baterias bateria(E_max = 7200000.0, E_start = 5000000.0);
  Motor_helice motor(P_motor_const = 180.0);
  
  // Variables observables globales para graficar resultados
  output Real SoC = bateria.SoC;
  output Real P_gen = panel.P_panel;
  output Real P_cons = motor.P_demand;
equation
  // Conexión del Entorno al Panel Solar
  panel.G = irra.G;
  panel.T_amb = irra.T_amb;
  
  // Conexión del Panel Solar y del Motor a la Batería
  bateria.P_in = panel.P_panel;
  bateria.P_out = motor.P_demand;
end Avion_solar;
