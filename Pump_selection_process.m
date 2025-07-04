pump_1 = readmatrix('32-125.csv');
pump_2 = readmatrix('32-160.csv');
pump_3 = readmatrix('32-200.csv');
pump_4 = readmatrix('40-125.csv');
pump_5 = readmatrix('40-160.csv');
pump_6 = readmatrix('40-200.csv');
pump_7 = readmatrix('50-125.csv');
pump_8 = readmatrix('50-160.csv');
pump_9 = readmatrix('50-200.csv');

pump(1).name = '32-125';
pump(1).Q = pump_1(:,1);
pump(1).H = pump_1(:,2);
pump(2).name = '32-160';
pump(2).Q = pump_2(:,1);
pump(2).H = pump_2(:,2);
pump(3).name = '32-200';
pump(3).Q = pump_3(:,1);
pump(3).H = pump_3(:,2);
pump(4).name = '40-125';
pump(4).Q = pump_4(:,1);
pump(4).H = pump_4(:,2);
pump(5).name = '40-160';
pump(5).Q = pump_5(:,1);
pump(5).H = pump_5(:,2);
pump(6).name = '40-200';
pump(6).Q = pump_6(:,1);
pump(6).H = pump_6(:,2);
pump(7).name = '50-125';
pump(7).Q = pump_7(:,1);
pump(7).H = pump_7(:,2);
pump(8).name = '50-160';
pump(8).Q = pump_8(:,1);
pump(8).H = pump_8(:,2);
pump(9).name = '50-200';
pump(9).Q = pump_9(:,1);
pump(9).H = pump_9(:,2);

Q_user = input('please Enter the Capacity (3-40):');
H_user = input('please Enter the Head (10-40):');

if Q_user<=40 && H_user<=40 && Q_user>=3 && H_user>=10

    found = 0;

    for i = 1:9
        x=i;
        in = inpolygon(Q_user, H_user, pump(i).Q, pump(i).H);
        if in
            fprintf('Your suitable pump: CENTRIFUGAL PUMP %s\n', pump(i).name);
            found = 1;
            break;
        end
    end

    if ~found
        fprintf('not found Suitable pump.\n');
        x=0;
    end
else 
    fprintf('Please enter the correct value.\n');
    x=0;
end

switch x
    case 1
        imp_dia_1 = readmatrix('imp-dia-32-125-110-115.csv');
        imp_dia_2 = readmatrix('imp-dia-32-125-115-120.csv');
        imp_dia_3 = readmatrix('imp-dia-32-125-120-125.csv');
        imp_dia_4 = readmatrix('imp-dia-32-125-125-130.csv');
        imp_dia_5 = readmatrix('imp-dia-32-125-130-139.csv');

        imp_dia(1).name = '115';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '120';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '125';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '130';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);
        imp_dia(5).name = '139';
        imp_dia(5).Q = imp_dia_5(:,1);
        imp_dia(5).H = imp_dia_5(:,2);

        rand_1 = readmatrix('32-125-rand-50-55-1.csv');
        rand_2 = readmatrix('32-125-rand-50-55-2.csv');
        rand_3 = readmatrix('32-125-rand-55-59-1.csv');
        rand_4 = readmatrix('32-125-rand-55-59-2.csv');
        rand_5 = readmatrix('32-125-rand-59-60-1.csv');
        rand_6 = readmatrix('32-125-rand-59-60-2.csv');
        rand_7 = readmatrix('32-125-rand-60-62.csv');
        rand_8 = readmatrix('32-125-rand-62-63.csv');
        rand_9 = readmatrix('32-125-rand-63-63.5.csv');

        rand(1).name = '50-55';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '50-55';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '55-59';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '55-59';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '59-60';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '59-60';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '60-62';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);
        rand(8).name = '62-63';
        rand(8).Q = rand_8(:,1);
        rand(8).H = rand_8(:,2);
        rand(9).name = '63-63.5';
        rand(9).Q = rand_9(:,1);
        rand(9).H = rand_9(:,2);

        for i = 1:5
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:9
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [115,0.84;120,0.98;125,1.13;130,1.35;139,1.75];
        Motor_electric_power_1 = [1.1,1.5,1.5,2.2];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_1(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_1(i));
                break;
            end
        end
    case 2
        imp_dia_1 = readmatrix('imp-dia-32-160-130-140.csv');
        imp_dia_2 = readmatrix('imp-dia-32-160-140-150.csv');
        imp_dia_3 = readmatrix('imp-dia-32-160-150-160.csv');
        imp_dia_4 = readmatrix('imp-dia-32-160-160-169.csv');

        imp_dia(1).name = '140';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '150';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '160';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '169';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);

        rand_1 = readmatrix('32-160-rand-45-50-1.csv');
        rand_2 = readmatrix('32-160-rand-45-50-2.csv');
        rand_3 = readmatrix('32-160-rand-50-55-1.csv');
        rand_4 = readmatrix('32-160-rand-50-55-2.csv');
        rand_5 = readmatrix('32-160-rand-55-58-1.csv');
        rand_6 = readmatrix('32-160-rand-55-58-2.csv');
        rand_7 = readmatrix('32-160-rand-58-60.csv');
        rand_8 = readmatrix('32-160-rand-60-62.csv');
        rand_9 = readmatrix('32-160-rand-62-63.5.csv');

        rand(1).name = '45-50';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '45-50';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '50-55';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '50-55';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '55-58';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '55-58';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '58-60';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);
        rand(8).name = '60-62';
        rand(8).Q = rand_8(:,1);
        rand(8).H = rand_8(:,2);
        rand(9).name = '62-63.5';
        rand(9).Q = rand_9(:,1);
        rand(9).H = rand_9(:,2);


        for i = 1:4
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:9
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [140,1.85;150,2.39;160,3.19;169,3.83];
        Motor_electric_power_2 = [2.2,3,4,4];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_2(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_2(i));
                break;
            end
        end
    case 3
        imp_dia_1 = readmatrix('imp-dia-32-200-170-180.csv');
        imp_dia_2 = readmatrix('imp-dia-32-200-180-190.csv');
        imp_dia_3 = readmatrix('imp-dia-32-200-190-200.csv');
        imp_dia_4 = readmatrix('imp-dia-32-200-200-209.csv');

        imp_dia(1).name = '180';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '190';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '200';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '209';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);

        rand_1 = readmatrix('32-200-rand-20-25.csv');
        rand_2 = readmatrix('32-200-rand-25-30.csv');
        rand_3 = readmatrix('32-200-rand-30-35.csv');
        rand_4 = readmatrix('32-200-rand-35-40.csv');
        rand_5 = readmatrix('32-200-rand-40-42.csv');
        rand_6 = readmatrix('32-200-rand-42-44.csv');
        rand_7 = readmatrix('32-200-rand-44-45.csv');

        rand(1).name = '20-25';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '25-30';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '30-35';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '35-40';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '40-42';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '42-44';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '44-45';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);

        for i = 1:4
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:7
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [180,2.7;190,3.5;200,4.3;209,4.98];
        Motor_electric_power_3 = [4,4,5.5,5.5];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_3(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_3(i));
                break;
            end
        end
    case 4
        imp_dia_1 = readmatrix('imp-dia-40-125-110-115.csv');
        imp_dia_2 = readmatrix('imp-dia-40-125-115-120.csv');
        imp_dia_3 = readmatrix('imp-dia-40-125-120-125.csv');
        imp_dia_4 = readmatrix('imp-dia-40-125-125-130.csv');
        imp_dia_5 = readmatrix('imp-dia-40-125-130-135.csv');
        imp_dia_6 = readmatrix('imp-dia-40-125-135-139.csv');

        imp_dia(1).name = '115';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '120';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '125';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '130';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);
        imp_dia(5).name = '135';
        imp_dia(5).Q = imp_dia_5(:,1);
        imp_dia(5).H = imp_dia_5(:,2);
        imp_dia(6).name = '139';
        imp_dia(6).Q = imp_dia_6(:,1);
        imp_dia(6).H = imp_dia_6(:,2);

        rand_1 = readmatrix('40-125-rand-50-55-1.csv');
        rand_2 = readmatrix('40-125-rand-50-55-2.csv');
        rand_3 = readmatrix('40-125-rand-55-60-1.csv');
        rand_4 = readmatrix('40-125-rand-55-60-2.csv');
        rand_5 = readmatrix('40-125-rand-60-65-1.csv');
        rand_6 = readmatrix('40-125-rand-60-65-2.csv');
        rand_7 = readmatrix('40-125-rand-65-68.csv');
        rand_8 = readmatrix('40-125-rand-68-70.csv');

        rand(1).name = '50-55';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '50-55';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '55-60';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '55-60';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '60-65';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '60-65';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '65-68';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);
        rand(8).name = '68-70';
        rand(8).Q = rand_8(:,1);
        rand(8).H = rand_8(:,2);

        for i = 1:6
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:8
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [115,1.3;120,1.51;125,1.71;130,1.95;135,2.25;139,2.49];
        Motor_electric_power_4 = [2.2,3,3,3];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_4(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_4(i));
                break;
            end
        end
    case 5
        imp_dia_1 = readmatrix('imp-dia-40-160-130-140.csv');
        imp_dia_2 = readmatrix('imp-dia-40-160-140-150.csv');
        imp_dia_3 = readmatrix('imp-dia-40-160-150-160.csv');
        imp_dia_4 = readmatrix('imp-dia-40-160-160-169.csv');

        imp_dia(1).name = '140';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '150';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '160';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '169';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);

        rand_1 = readmatrix('40-160-rand-40-45.csv');
        rand_2 = readmatrix('40-160-rand-50-55.csv');
        rand_3 = readmatrix('40-160-rand-55-60.csv');
        rand_4 = readmatrix('40-160-rand-60-64.csv');
        rand_5 = readmatrix('40-160-rand-64-66.csv');
        rand_6 = readmatrix('40-160-rand-66-67.5.csv');

        rand(1).name = '40-45';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '50-55';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '55-60';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '60-64';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '64-66';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '66-67.5';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);

        for i = 1:4
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:6
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [140,2.35;150,2.95;160,3.79;169,4.6];
        Motor_electric_power_5 = [3,4,5.5,5.5];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_5(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_5(i));
                break;
            end
        end
    case 6
        imp_dia_1 = readmatrix('imp-dia-40-200-170-180.csv');
        imp_dia_2 = readmatrix('imp-dia-40-200-180-190.csv');
        imp_dia_3 = readmatrix('imp-dia-40-200-190-200.csv');
        imp_dia_4 = readmatrix('imp-dia-40-200-200-209.csv');

        imp_dia(1).name = '180';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '190';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '200';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '209';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);

        rand_1 = readmatrix('40-200-rand-35-40.csv');
        rand_2 = readmatrix('40-200-rand-40-45.csv');
        rand_3 = readmatrix('40-200-rand-45-50-1.csv');
        rand_4 = readmatrix('40-200-rand-45-50-2.csv');
        rand_5 = readmatrix('40-200-rand-50-54.csv');
        rand_6 = readmatrix('40-200-rand-54-57.csv');
        rand_7 = readmatrix('40-200-rand-57-59.csv');
        rand_8 = readmatrix('40-200-rand-59-60.csv');

        rand(1).name = '35-40';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '40-45';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '45-50';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '45-50';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '50-54';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '54-57';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '57-59';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);
        rand(8).name = '59-60';
        rand(8).Q = rand_8(:,1);
        rand(8).H = rand_8(:,2);


        for i = 1:4
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:8
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [180,4.5;190,5.5;200,6.6;209,7.75];
        Motor_electric_power_6 = [5.5,5.5,7.5,11];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_6(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_6(i));
                break;
            end
        end
    case 7
        imp_dia_1 = readmatrix('imp-dia-50-125-110-115.csv');
        imp_dia_2 = readmatrix('imp-dia-50-125-115-120.csv');
        imp_dia_3 = readmatrix('imp-dia-50-125-120-125.csv');
        imp_dia_4 = readmatrix('imp-dia-50-125-125-130.csv');
        imp_dia_5 = readmatrix('imp-dia-50-125-130-139.csv');

        imp_dia(1).name = '115';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '120';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '125';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '130';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);
        imp_dia(5).name = '139';
        imp_dia(5).Q = imp_dia_5(:,1);
        imp_dia(5).H = imp_dia_5(:,2);

        rand_1 = readmatrix('50-125-rand-60-70-1.csv');
        rand_2 = readmatrix('50-125-rand-60-70-2.csv');
        rand_3 = readmatrix('50-125-rand-70-75.csv');
        rand_4 = readmatrix('50-125-rand-75-77.csv');
        rand_5 = readmatrix('50-125-rand-77-78.csv');
        rand_6 = readmatrix('50-125-rand-78-78.csv');

        rand(1).name = '60-70';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '60-70';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '70-75';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '75-77';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '77-78';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '78';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);

        for i = 1:5
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:6
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [115,2.6;120,2.95;125,3.38;130,3.8;139,5.05];
        Motor_electric_power_7 = [3,4,4,5.5];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_7(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_7(i));
                break;
            end
        end
    case 8
        imp_dia_1 = readmatrix('imp-dia-50-160-130-140.csv');
        imp_dia_2 = readmatrix('imp-dia-50-160-140-150.csv');
        imp_dia_3 = readmatrix('imp-dia-50-160-150-160.csv');
        imp_dia_4 = readmatrix('imp-dia-50-160-160-169.csv');

        imp_dia(1).name = '140';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '150';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '160';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '169';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);

        rand_1 = readmatrix('50-160-rand-55-60.csv');
        rand_2 = readmatrix('50-160-rand-60-65.csv');
        rand_3 = readmatrix('50-160-rand-65-70.csv');
        rand_4 = readmatrix('50-160-rand-70-73.csv');
        rand_5 = readmatrix('50-160-rand-73-75.csv');
        rand_6 = readmatrix('50-160-rand-75-76.csv');
        rand_7 = readmatrix('50-160-rand-76-76.csv');

        rand(1).name = '55-60';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '60-65';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '65-70';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '70-73';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '73-75';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '75-76';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '76';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);

        for i = 1:4
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:7
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [140,3.6;150,4.8;160,6.12;169,7.75];
        Motor_electric_power_8 = [5.5,5.5,7.5,11];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_8(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_8(i));
                break;
            end
        end
    case 9
        imp_dia_1 = readmatrix('imp-dia-50-200-170-180.csv');
        imp_dia_2 = readmatrix('imp-dia-50-200-180-190.csv');
        imp_dia_3 = readmatrix('imp-dia-50-200-190-200.csv');
        imp_dia_4 = readmatrix('imp-dia-50-200-200-209.csv');

        imp_dia(1).name = '180';
        imp_dia(1).Q = imp_dia_1(:,1);
        imp_dia(1).H = imp_dia_1(:,2);
        imp_dia(2).name = '190';
        imp_dia(2).Q = imp_dia_2(:,1);
        imp_dia(2).H = imp_dia_2(:,2);
        imp_dia(3).name = '200';
        imp_dia(3).Q = imp_dia_3(:,1);
        imp_dia(3).H = imp_dia_3(:,2);
        imp_dia(4).name = '209';
        imp_dia(4).Q = imp_dia_4(:,1);
        imp_dia(4).H = imp_dia_4(:,2);

        rand_1 = readmatrix('50-200-rand-50-55.csv');
        rand_2 = readmatrix('50-200-rand-55-60.csv');
        rand_3 = readmatrix('50-200-rand-60-65.csv');
        rand_4 = readmatrix('50-200-rand-65-68-1.csv');
        rand_5 = readmatrix('50-200-rand-65-68-2.csv');
        rand_6 = readmatrix('50-200-rand-68-70.csv');
        rand_7 = readmatrix('50-200-rand-70-72.csv');
        rand_8 = readmatrix('50-200-rand-72-73.csv');

        rand(1).name = '50-55';
        rand(1).Q = rand_1(:,1);
        rand(1).H = rand_1(:,2);
        rand(2).name = '55-60';
        rand(2).Q = rand_2(:,1);
        rand(2).H = rand_2(:,2);
        rand(3).name = '60-65';
        rand(3).Q = rand_3(:,1);
        rand(3).H = rand_3(:,2);
        rand(4).name = '65-68';
        rand(4).Q = rand_4(:,1);
        rand(4).H = rand_4(:,2);
        rand(5).name = '65-68';
        rand(5).Q = rand_5(:,1);
        rand(5).H = rand_5(:,2);
        rand(6).name = '68-70';
        rand(6).Q = rand_6(:,1);
        rand(6).H = rand_6(:,2);
        rand(7).name = '70-72';
        rand(7).Q = rand_7(:,1);
        rand(7).H = rand_7(:,2);
        rand(8).name = '72-73';
        rand(8).Q = rand_8(:,1);
        rand(8).H = rand_8(:,2);

        for i = 1:4
            y=i;
            in = inpolygon(Q_user, H_user, imp_dia(i).Q, imp_dia(i).H);
            if in
                fprintf('The suitable impeller diameter for you: %s mm\n', imp_dia(i).name);
                break;
            end
        end

        for i = 1:8
            in = inpolygon(Q_user, H_user, rand(i).Q, rand(i).H);
            if in
                fprintf('Pump Efficiency Range: %s \n', rand(i).name);
                break;
            end
        end

        Motor_electric_power = [180,8;190,10;200,12.5;209,14.5];
        Motor_electric_power_9 = [11,11,15,18.5];
        for i = 1:4
            if Motor_electric_power(y,2)<=Motor_electric_power_9(i)
                fprintf('The suitable Motor electric power for you: %f kw\n',Motor_electric_power_9(i));
                break;
            end
        end
end

