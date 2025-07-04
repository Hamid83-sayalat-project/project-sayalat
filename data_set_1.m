% Hamid Reza Hatami 40226045 - Mohammad Reza Hozouri 40226048
format long
Flow_rate_psig = [0,500,800,1000,1100,1200,1400,1500];
Flow_rate_si = Flow_rate_psig * 6.309 * 10^(-5);
Suction_pressure_psig = [0.65,0.25,-0.35,-0.92,-1.24,-1.62,-2.42,-2.89];
Suction_pressure_si = Suction_pressure_psig * 6894.76;
Discharge_pressure_psig = [53.3,48.3,42.3,36.9,33,27.8,15.3,7.3];
Discharge_pressure_si = Discharge_pressure_psig * 6894.76;
Motor_Current_amp = [18,26.2,31,33.9,35.2,36.3,38,39];
Voltage = 460;
Power_factor = 0.875;
Randeman_motor = 0.9;
Randeman_mech = 1;
z1_ft=1;
z1_si= z1_ft * 0.3048;
z2_ft=3;
z2_si= z2_ft * 0.3048;
W_rpm=1750;
W_rad_s= W_rpm * 2 * pi /60;
rho_water_si=996.59;
Gravity_si = 9.81;
Head = zeros(1,8);
Hydraulic_power = zeros(1,8);
Specific_speed = zeros(1,8);
P_in = zeros(1,8);
Randeman_total = zeros(1,8);

for i = 1:8
    Head(i)= ((Discharge_pressure_si(i)-Suction_pressure_si(i))/(rho_water_si * Gravity_si)) + z2_si - z1_si ;
end

for i= 1:8
    Hydraulic_power(i) = rho_water_si * Gravity_si * Flow_rate_si(i) * Head(i) ;
end

for i= 1:8
    Specific_speed(i) = (Flow_rate_si(i)^(0.5) * W_rad_s) / ((Head(i)*(Gravity_si))^(3/4)) ;
end

for i= 1:8
    P_in(i) = Randeman_motor * 3^(0.5) * Power_factor * Voltage * Motor_Current_amp(i) ;
end

for i= 1:8
    Randeman_total(i) = Hydraulic_power(i) / P_in(i) ;
end

Function_Head = polyfit(Flow_rate_si,Head,5);
Function_Hydraulic_power = polyfit(Flow_rate_si,Hydraulic_power,5);
Function_Specific_speed = polyfit(Flow_rate_si,Specific_speed,5);
Function_Randeman_total = polyfit(Flow_rate_si,Randeman_total,5);

poly_val_Head = polyval(Function_Head,Flow_rate_si);
poly_val_Hydraulic_power = polyval(Function_Hydraulic_power,Flow_rate_si);
poly_val_Specific_speed = polyval(Function_Specific_speed,Flow_rate_si);
poly_val_Randeman_total = polyval(Function_Randeman_total,Flow_rate_si);

subplot(2,2,1);
plot(Flow_rate_si,Head,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Head,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Head','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Head (m)','FontSize',12)
grid on

subplot(2,2,2);
plot(Flow_rate_si,Hydraulic_power,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Hydraulic_power,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Hydraulic power','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Hydraulic power (w)','FontSize',12)
grid on

subplot(2,2,3);
plot(Flow_rate_si,Specific_speed,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Specific_speed,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Specific speed','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Specific speed (non-dimensional)','FontSize',12)
grid on

subplot(2,2,4);
plot(Flow_rate_si,Randeman_total,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Randeman_total,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Randeman total','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Randeman total (non-dimensional)','FontSize',12)
grid on

x_name = ["x^5","x^4","x^3","x^2","x^1","x^0"];
disp("Function_Head = ")
for i= 1:6
    if Function_Head(i)>0
    fprintf(' +%f * %s ',Function_Head(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Head(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Hydraulic_power =")
for i= 1:6
    if Function_Hydraulic_power(i)>0
    fprintf(' +%f * %s ',Function_Hydraulic_power(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Hydraulic_power(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Specific_speed =")
for i= 1:6
    if Function_Head(i)>0
    fprintf(' +%f * %s ',Function_Specific_speed(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Specific_speed(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Randeman_total =")
for i= 1:6
    if Function_Head(i)>0
    fprintf(' +%f * %s ',Function_Randeman_total(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Randeman_total(i),x_name(i));
    end
end