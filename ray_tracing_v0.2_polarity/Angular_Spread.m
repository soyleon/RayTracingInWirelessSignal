%% Angular spread


for i = 1:num_ray_R-1
    ZenithOA(1,i) = acosd(dot(AOA_vec(1:3,i),[0,0,1]));
    if AOA_vec(2,i)>=0
        AzimuthOA(1,i) = acosd(dot(AOA_vec(1:3,i),[1,0,0]));
    else
        AzimuthOA(1,i) = 360-acosd(dot(AOA_vec(1:3,i),[1,0,0]));
    end
    ZenithOD(1,i) = acosd(dot(AOD_vec(1:3,i),[0,0,1]));
    if AOD_vec(2,i)>=0
        AzimuthOD(1,i) = acosd(dot(AOD_vec(1:3,i),[1,0,0]));
    else
        AzimuthOD(1,i) = 360-acosd(dot(AOD_vec(1:3,i),[1,0,0]));
    end
end
figure
stem(AzimuthOA,pathloss_ray_dB,'linewidth',2);
xlabel('Azimuth of Arival, units:бу');
ylabel('Pathloss, units:dB');

figure
stem(AzimuthOA,power_received_ray,'linewidth',2);
xlabel('Azimuth of Arival, units:бу');
ylabel('Received Power, units:dB');

figure
stem(ZenithOA,pathloss_ray_dB,'linewidth',2);
xlabel('Zenith of Arival, units:бу');
ylabel('Pathloss, units:dB');

figure
stem(ZenithOA,power_received_ray,'linewidth',2);
xlabel('Zenith of Arival, units:бу');
ylabel('Received Power, units:dB');

figure
stem(AzimuthOD,pathloss_ray_dB,'linewidth',2);
xlabel('Azimuth of Departure, units:бу');
ylabel('Pathloss, units:dB');

figure
stem(AzimuthOD,power_received_ray,'linewidth',2);
xlabel('Azimuth of Departure, units:бу');
ylabel('Received Power, units:dB');

figure
stem(ZenithOD,pathloss_ray_dB,'linewidth',2);
xlabel('Zenith of Departure, units:бу');
ylabel('Pathloss, units:dB');

figure
stem(ZenithOD,power_received_ray,'linewidth',2);
xlabel('Zenith of Departure, units:бу');
ylabel('Received Power, units:dB');
