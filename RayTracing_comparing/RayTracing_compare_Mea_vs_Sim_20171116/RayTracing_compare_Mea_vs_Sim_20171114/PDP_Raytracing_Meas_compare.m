%% 比较实测结果和射线跟踪仿真结果
%2017.04.13 version 1
%2017.11.08 version 2 3D picture

close all;
clear all;

load TimeDelay_vs_Antenna;
delay_ray = ArrayFromSmallToBig;
load PDP_vs_Antenna;
pdp_ray = PDPrank;

load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

and_num = 95;
Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns

Len = 30; %显示部分
Delay = (0:Len-1)*T0all; %ns

num_ray = 0;
num_mea = 0;
for ant_tar = 1:64;
[val, id] = max(pdp_mea(ant_tar,:));
pdp_mea_norm = pdp_mea(ant_tar,:) - val;
pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);

snr_hor = mean(SNR(ant_tar,:));
NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin


valid_ray_id = find(pdp_ray(ant_tar,:) ~= -Inf);
pdp_ray_norm_tar = pdp_ray(ant_tar,valid_ray_id) - pdp_ray(ant_tar,valid_ray_id(1)); %时延已按从小到大排列
delay_ray_norm_tar = delay_ray(ant_tar,valid_ray_id) - delay_ray(ant_tar,valid_ray_id(1));

ray_num = size(delay_ray_norm_tar);

for m = 1:ray_num(1,2)
    num_ray = num_ray+1;
    data_ray(num_ray,1) = ant_tar;
    data_ray(num_ray,2) = delay_ray_norm_tar(1,m);
    data_ray(num_ray,3) = pdp_ray_norm_tar(1,m);
    nf(num_ray,1) = NF_hor; 
end


mea_num = size(pdp_mea_norm_tar);
for n = 1:mea_num(1,2)
    num_mea = num_mea+1;
    data_mea(num_mea,1) = ant_tar;
    data_mea(num_mea,2) = Delay(1,n);
    data_mea(num_mea,3) = pdp_mea_norm_tar(1,n);
    
end
%figure(ant_tar)
%plot(Delay,pdp_mea_norm_tar,'b-',delay_ray_norm_tar,pdp_ray_norm_tar,'r-',Delay,ones(1,Len)*NF_hor,'g--','LineWidth',2)
%legend('Measured','Ray Tracing','Noise floor')
%grid on;
%xlabel('Delay (ns)');
%ylabel('PDP(dB)')

end
figure;

[ant_tar,delay] = meshgrid(1:64,1:150);
PDP_ray = griddata(data_ray(:,1),data_ray(:,2),data_ray(:,3),ant_tar,delay);
PDP_mea = griddata(data_mea(:,1),data_mea(:,2),data_mea(:,3),ant_tar,delay);
pdp_nf = griddata(data_ray(:,1),data_ray(:,2),nf(:,1),ant_tar,delay);
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
        c(i,j,3)=1;%红色
     end
end
surf(ant_tar,delay,PDP_mea,del2(PDP_mea));colormap hot
hold on;
bl=[0 0 1];
%colormap(bl)
c =zeros(150,64);
for i=1:150
    for j=1:64
        c(i,j,1)=0;
        c(i,j,2)=1;
        c(i,j,3)=0;%红色
     end
end
surf(ant_tar,delay,pdp_nf,c);
shading interp;
legend('Measured','Ray Tracing','Noise floor')
grid on;
xlabel('AntennaID');
ylabel('Delay (ns)');
zlabel('PDP(dB)');
