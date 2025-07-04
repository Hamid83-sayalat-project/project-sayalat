% Hamid Reza Hatami 40226045 - Mohammad Reza Hozouri 40226048
format long
Torque_si = [2.1,2,1.9,1.8,1.7,1.7,1.5,1.5,1.4,1.2,1.1,1,0.9];
Flow_rate = [254,228,197,177,163,155,129,127,99,75,50,27,2];
Flow_rate_si = Flow_rate / 60000;
Suction_pressure_bar = [-0.08,-0.07,-0.05,-0.05,-0.06,-0.04,-0.03,-0.03,-0.02,-0.02,-0.02,-0.01,-0.01];
Suction_pressure_si = Suction_pressure_bar * (10^5);
Discharge_pressure_bar = [0.06,0.11,0.18,0.21,0.25,0.25,0.29,0.29,0.32,0.34,0.35,0.36,0.36];
Discharge_pressure_si = Discharge_pressure_bar * (10^5);
Motor_power_kw = [0.52,0.5,0.48,0.47,0.46,0.45,0.42,0.42,0.4,0.38,0.36,0.33,0.31];
Motor_power_si = Motor_power_kw * 1000;
W_rpm=1100;
W_rad_s= W_rpm * 2 * pi / 60;
rho_water_si=997.047;
Gravity_si = 9.81;
Head = zeros(1,13);
Hydraulic_power = zeros(1,13);
Mechanical_Power = zeros(1,13);
Specific_speed = zeros(1,13);
Randeman_total = zeros(1,13);

for i = 1:13
    Head(i)= (Discharge_pressure_si(i)-Suction_pressure_si(i))/(rho_water_si * Gravity_si) ;
end

for i= 1:13
    Hydraulic_power(i) = rho_water_si * Gravity_si * Flow_rate_si(i) * Head(i) ;
end

for i = 1:13
    Mechanical_Power(i)= Torque_si(i) * W_rad_s ;
end

for i= 1:13
    Specific_speed(i) = (Flow_rate_si(i)^(0.5) * W_rad_s) / ((Head(i)*(Gravity_si))^(3/4)) ;
end

for i= 1:13
    Randeman_total(i) = Hydraulic_power(i) / Motor_power_si(i) ;
end

Function_Head = polyfit(Flow_rate_si,Head,11);
Function_Hydraulic_power = polyfit(Flow_rate_si,Hydraulic_power,11);
Function_Mechanical_Power = polyfit(Flow_rate_si,Mechanical_Power,11);
Function_Specific_speed = polyfit(Flow_rate_si,Specific_speed,11);
Function_Randeman_total = polyfit(Flow_rate_si,Randeman_total,11);

poly_val_Head = polyval(Function_Head,Flow_rate_si);
poly_val_Hydraulic_power = polyval(Function_Hydraulic_power,Flow_rate_si);
poly_val_Mechanical_Power = polyval(Function_Mechanical_Power,Flow_rate_si);
poly_val_Specific_speed = polyval(Function_Specific_speed,Flow_rate_si);
poly_val_Randeman_total = polyval(Function_Randeman_total,Flow_rate_si);

subplot(2,3,1);
plot(Flow_rate_si,Head,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Head,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Head','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Head (m)','FontSize',12)
grid on

subplot(2,3,2);
plot(Flow_rate_si,Hydraulic_power,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Hydraulic_power,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Hydraulic power','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Hydraulic power (w)','FontSize',12)
grid on

subplot(2,3,3);
plot(Flow_rate_si,Mechanical_Power,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Mechanical_Power,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Mechanical Power','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Mechanical Power (w)','FontSize',12)
grid on

subplot(2,3,4);
plot(Flow_rate_si,Specific_speed,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Specific_speed,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Specific speed','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Specific speed (non-dimensional)','FontSize',12)
grid on

subplot(2,3,5);
plot(Flow_rate_si,Randeman_total,'g','LineWidth',4);
hold on
plot(Flow_rate_si,poly_val_Randeman_total,'-.x','LineWidth',2);
legend('orginal plot','Fitted curve')
title('Randeman total','FontSize',14)
xlabel('Flow rate (m3/h)','FontSize',12)
ylabel('Randeman total (non-dimensional)','FontSize',12)
grid on

x_name = ["x^11","x^10","x^9","x^8","x^7","x^6","x^5","x^4","x^3","x^2","x^1","x^0"];
disp("Function_Head = ")
for i= 1:12
    if Function_Head(i)>0
    fprintf(' +%f * %s ',Function_Head(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Head(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Hydraulic_power =")
for i= 1:12
    if Function_Hydraulic_power(i)>0
    fprintf(' +%f * %s ',Function_Hydraulic_power(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Hydraulic_power(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Mechanical_Power = ")
for i= 1:12
    if Function_Mechanical_Power(i)>0
    fprintf(' +%f * %s ',Function_Mechanical_Power(i),x_name(i));
    else
    fprintf(' -%f * %s ',Function_Mechanical_Power(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Specific_speed =")
for i= 1:12
    if Function_Head(i)>0
    fprintf(' +%f * %s ',Function_Specific_speed(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Specific_speed(i),x_name(i));
    end
end
fprintf('\n');
disp("Function_Randeman_total =")
for i= 1:12
    if Function_Head(i)>0
    fprintf(' +%f * %s ',Function_Randeman_total(i),x_name(i));
    else
    fprintf(' -%f * %s ',-Function_Randeman_total(i),x_name(i));
    end
end