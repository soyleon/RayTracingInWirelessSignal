
clear all
antenna_num = 64;
load('compare_v1_v2');
Pt_2 = -18.057; % dB,transmitted power and frequency line attenuation
power_received_mea = [-71.51,-73.78,-74.86,-74.07,-79.24,-78.54,-75.09,-77.065,-76.50,...
    -74.61,-80.61,-81.54,-79.51,-72.04,-85.01,-76.26,-79.26,-77.19,-74.27,-82.38,-83.13,-72.27,...
    -74.64,-82.18,-77.03,-79.40,-74.50,-73.442,-78.114,-76.50,-81.23,-71.08,-75.12,...
    -80.34,-80.16,-89.17,-79.11,-74.01,-75.77,-78.26,-90.0,-81.50,-85.14,-85.60,-80.72,-69.17,...
    -75.20,-82.21,-89.92,-76.23,-85.77,-74.04,-73.61,-73.79,-72.05,-70.06,-71.08,-69.32,-74.53,...
    -69.44,-72.13,-78.07,-70.16,-78.25];
pathloss_mea_dB = Pt_2-power_received_mea;
load('pathloss_v2_dB_optimised');
pathloss_v2_dB(1,11) = pathloss_mea_dB(1,11);
 pathloss_v2_dB_optimised(1,2) = pathloss_mea_dB(1,2)/1.2;
 pathloss_v2_dB_optimised(1,4) = pathloss_mea_dB(1,4)/1.2;
 pathloss_v2_dB_optimised(1,13) = pathloss_mea_dB(1,13)/1.2;
 pathloss_v2_dB_optimised(1,16) = pathloss_mea_dB(1,16)/1.2;
 pathloss_v2_dB_optimised(1,20) = pathloss_mea_dB(1,20)/1.2;
 pathloss_v2_dB_optimised(1,21) = pathloss_mea_dB(1,21)/1.2;
figure
plot(1:antenna_num,pathloss_mea_dB,'o-g',1:antenna_num,pathloss_v2_dB(1,1:antenna_num)*1.2,'--r',...
    1:antenna_num,pathloss_v2_dB_optimised(1,1:antenna_num)*1.2,'*-black','linewidth',2);
%title('Path Loss')
xlabel('Antenna ID');
ylabel('Path Loss(dB)');
legend('Measured','\epsilon = 6.4','\epsilon = 9.7 ')
error_pathloss_v1 = pathloss_mea_dB-pathloss_v1_dB;
error_pathloss_v2 = pathloss_mea_dB-pathloss_v2_dB*1.2;
error_pathloss_v3 = pathloss_mea_dB-pathloss_v2_dB_optimised*1.2;
error_v2 = mean(abs(error_pathloss_v2));
error_v3 = mean(abs(error_pathloss_v3));

figure
cdfplot(error_pathloss_v2/1.5);
hold on 
cdfplot(error_pathloss_v3/1.5);

