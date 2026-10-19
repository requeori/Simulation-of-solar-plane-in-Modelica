class Motor_helice
parameter Real P_motor_const = 180.0 "Potencia demandada en crucero (W)";
  
  output Real P_demand "Potencia consumida (W)";
equation
  // Potencia constante consumida por el motor en régimen de vuelo nivelado
  P_demand = P_motor_const;
end Motor_helice;
