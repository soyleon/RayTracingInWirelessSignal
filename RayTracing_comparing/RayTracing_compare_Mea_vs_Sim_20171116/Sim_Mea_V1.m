%% Comparasion V1


%% draw difference of PDP,Received sum POWER, RMS, K value, Ray_number


close all;
clear all;
%% read the simulated data
load TimeDelay_vs_Antenna;
delay_ray = ArrayFromSmallToBig; % pathloss value
load PDP_vs_Antenna;
pdp_ray = PDPrank;

%% RayTracing powerT & Measured PowerT & Gain_ReceiverT
Gain_receiver = 55; % the receiver Gain is about 55dB , which can be find in the Sora receiver
PowerT_mea = 15;% transmitte power of SORA
PowerT_ray = 20;% the setup of PT units:dBm;

%射线跟踪法结果的文件格式和变量命名需要标准化

%% read the measured data
load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

and_num = 95;%Measured antenna number
Nifftall = 640; %整体频域信道ifft点数，得h(t)  (意义？及作用？）
T0all = 5; % ns（时间分辨率）

Len = 30; %显示部分
Delay = (0:Len-1)*T0all; %ns

num_ray = 0;
num_mea = 0;
ant_num = 64;

for ant_tar = 1:64;
    %%
    % measured data procesing
    [val, id] = max(pdp_mea(ant_tar,:));
    
    pdp_mea_norm = pdp_mea(ant_tar,:) - val;%Norm
    pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);%  the max value is directed ray
    pdp_mea_tar = pdp_mea(ant_tar,id:id+Len-1)-70;% UNNORM
    pdp_mea_tar_linear = 10.^(pdp_mea_tar./10); % Measured Linear value
    power_mea(ant_tar,:) = sum(pdp_mea_tar_linear);
    mean_delay_mea = sum(Delay.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
    rms_delay_mea(ant_tar) = sqrt(sum((Delay - mean_delay_mea).^2.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear));
    
    %%
    % noise floor
    snr_hor = mean(SNR(ant_tar,:));
    NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin????
    
    %%
    % ray_tracing data procesing
    valid_ray_id = find(pdp_ray(ant_tar,:) ~= -Inf);
    pdp_ray_tar = pdp_ray(ant_tar,valid_ray_id);% the version 1 make a mistake that the transmitter emitted rays that divided the power to every ray,so add 70 is the whole ray number
    pdp_ray_norm_tar = pdp_ray(ant_tar,valid_ray_id) - pdp_ray(ant_tar,valid_ray_id(1));%Norm
    delay_ray_norm_tar = delay_ray(ant_tar,valid_ray_id) - delay_ray(ant_tar,valid_ray_id(1)); %time delay is sorted from small to big
    pdp_ray_tar_linear = 10.^(pdp_ray_tar./10);
    power_ray(ant_tar,:) = sum(pdp_ray_tar_linear);
    mean_delay_ray = sum(delay_ray_norm_tar.*pdp_ray_tar_linear)/sum(pdp_ray_tar_linear);
    rms_delay_ray(ant_tar) = sqrt(sum((delay_ray_norm_tar - mean_delay_ray).^2.*pdp_ray_tar_linear)/sum(pdp_ray_tar_linear));
    
    %%
    % calculate the pdp error at intersect time delay point 
%     valid_ray = find(pdp_ray_norm_tar(1,:)>NF_hor);
%     pdp_ray_norm_tar = pdp_ray_norm_tar(1,valid_ray);
%     delay_ray_norm_tar = delay_ray_norm_tar(1,valid_ray);
%     
%     valid_mea = find(pdp_mea_norm_tar(1,:)>NF_hor);
%     pdp_mea_norm_tar = pdp_mea_norm_tar(1,valid_mea);
%     Delay_mea = Delay(1,valid_mea);
%     
%     [Delay_common,num_valid_ray_id,num_Delay] = intersect(delay_ray_norm_tar,Delay_mea);
%     delay_mea_norm_tar = Delay_mea(1,num_Delay(:,1));
%     pdp_mea_norm_tar = pdp_mea_norm_tar(1,num_Delay(:,1));
%     delay_ray_norm_tar = delay_ray_norm_tar(1,num_valid_ray_id(:,1));
%     pdp_ray_norm_tar = pdp_ray_norm_tar(1,num_valid_ray_id(:,1));
%     
%     error = abs(pdp_mea_norm_tar-pdp_ray_norm_tar);
    
    %??? it may can not illustrate the difference betweend simulation and
    %measurement
    %%
    % interpolation of the three parameters
    ray_num = size(delay_ray_norm_tar);
    
    for m = 1:ray_num(1,2)
        num_ray = num_ray+1;
        data_ray(num_ray,1) = ant_tar;
        data_ray(num_ray,2) = delay_ray_norm_tar(1,m);
        data_ray(num_ray,3) = pdp_ray_norm_tar(1,m);
%        nf(num_ray,1) = NF_hor;
    end
    
    
    mea_num = size(pdp_mea_norm_tar);
    for n = 1:mea_num(1,2)
        num_mea = num_mea+1;
        data_mea(num_mea,1) = ant_tar;
        data_mea(num_mea,2) = Delay(1,n);
        data_mea(num_mea,3) = pdp_mea_norm_tar(1,n);
    end
    
    %% PDP figure every antenna
    %figure(antenna)
    %plot(Delay,pdp_mea_norm_tar,'b-',delay_ray_norm_tar,pdp_ray_norm_tar,'r-',Delay,ones(1,Len)*NF_hor,'g--','LineWidth',2)
    %legend('Measured','Ray Tracing','Noise floor')
    %grid on;
    %xlabel('Delay (ns)');
    %ylabel('PDP(dB)')
    
end

%%  dB value and pathloss
power_mea_dB = 10*log10(power_mea);
power_ray_dB = 10*log10(power_ray);% in the v1 , the power ray is pathloss
path_loss_mea = power_mea_dB - Gain_receiver - PowerT_mea;
path_loss_ray = power_ray_dB - PowerT_ray;


rms_error = rms_delay_mea - rms_delay_ray;


%% 3D PDP draw
figure(1);

[ant_tar,delay] = meshgrid(1:64,1:150);
PDP_ray = griddata(data_ray(:,1),data_ray(:,2),data_ray(:,3),ant_tar,delay);
PDP_mea = griddata(data_mea(:,1),data_mea(:,2),data_mea(:,3),ant_tar,delay);
%pdp_nf = griddata(data_ray(:,1),data_ray(:,2),nf(:,1),ant_tar,delay);
%re=[1 0 0];
%colormap(re)
c =zeros(150,64);
for i=1:150
    for j=1:64
        c(i,j,1)=0;
        c(i,j,2)=0;
        c(i,j,3)=1;%红色
     end
end
surf(ant_tar,delay,PDP_ray);
hold on;
%gr=[0 1 0];
%colormap(gr)
c =zeros(150,64);
for i=1:150
    for j=1:64
        c(i,j,1)=0;
        c(i,j,2)=0;
        c(i,j,3)=1;%蓝色
     end
end
surf(ant_tar,delay,PDP_mea,del2(PDP_mea));colormap hot
hold on;
bl=[0 0 1];
%colormap(bl)
% c =zeros(150,64);
% for i=1:150
%     for j=1:64
%         c(i,j,1)=0;
%         c(i,j,2)=1;
%         c(i,j,3)=0;%绿色
%      end
% end
% surf(ant_tar,delay,pdp_nf,c);
shading interp;
legend('Measured','Ray Tracing')
grid on;
xlabel('AntennaID');
ylabel('Delay (ns)');
zlabel('PDP(dB)');


%% RMS figure 

figure(2)
plot(1:ant_num,rms_delay_mea,'b-',1:ant_num,rms_delay_ray,'r--','linewidth',2)
xlabel('Antenna ID');
ylabel('RMS(Root Mean Square, ns)');
legend('Measured','Ray Tracing');

%% Sum power figure

figure(3)
plot(1:ant_num,-power_mea_dB,'b-',1:ant_num,-power_ray_dB,'r--','linewidth',2)
xlabel('Antenna ID');
ylabel('Path Loss (dB)');
legend('Measured','Ray Tracing');

