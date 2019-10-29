%% 20171211测量路径损耗  2，4G 单频点
power_tx = 10; %单位 dBm
frequency = 2.4*10^9;% 频点
line_loss = 7.73;%dB
power_received = [-66.388,-63.853,-64.470,-66.449,-60.834,-61.701,-65.891,...
    -59.240,-60.955,-74.718,-63.588,-62.866,-70.252,-66.729...
    -60.977,-63.594,-66.091,-61.676,-63.814,-62.331,-63.091,...
    -67.055,-67.556,-69.915,-68.238,-71.117,-63.927,-61.499,...
    -62.412,-65.545,-60.111,-60.405,-63.901,-62.983,-69.274,-66.926...
    -65.524,-69.088,-64.227,-66.377,-60.398,-59.890,-66.282,-60.452,...
    -61.248,-65.736,-62.757,-62.152,-66.546,-72.630,-67.890,-65.798,...
    -65.941,-68.259,-71.389,-69.308,-67.966,-63.846,-64.488...
    -69.879,-62.274,-64.180,-67.511,-61.608];
pathloss_mea = power_tx - power_received-line_loss;
%plot(1:64,pathloss_mea);


load('office_64antenna_point1_2.4G_20171212.mat');
pl = pl-10*log10(number);
pathloss_v1 = pl;

pathloss_v2 = zeros(1,64);
for file_num = 1:64
    load(['E:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v2_indoor_tx1_rx1\20171214_wall_polarity_2.4G\indoor_Rv0.2_antenna',num2str(file_num),'.mat']);
    close(hwait);
    power_received_sum=GainthetaR*pt_ray.*abs(E_loss_sum).^2*2*pi/wavelength;%sum(power_received_ray);%总接收功率
    pathloss_sum = power_tx./power_received_sum;%路径损耗 （正数）
    pathloss_sum_dB=10*log10(power_tx./power_received_sum);%路径损耗
    pathloss_v2(1,file_num) = pathloss_sum_dB+10*log10(2*pi/wavelength);
end
antenna_id = 1:64;
plot(antenna_id,pathloss_mea,'-g',antenna_id,pathloss_v1,'.-r',antenna_id,pathloss_v2,'-b','linewidth',2)
xlabel('AntennaID');
ylabel('Pathloss units:dBm');
legend('Measurement','Simple Raytracing','Considering wall')
