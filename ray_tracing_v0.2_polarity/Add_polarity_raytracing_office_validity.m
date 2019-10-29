%%ʵ���ҷ�����Ч����֤�����������1��������Ͷ��������2�����ߵĸ��������棻3�����书�ʣ�4��Ƶ�ʣ�5���������յ��λ�ú͸߶ȣ�6��������ĸ���糣����

clear
tic;
%%
%Input; height = 3.1m, width = 6.8m, length = 6.5m
n_floor_face = [0,0,1,0];
n_ceiling_face = [0,0,1,-3.1];
n_leftwall_face = [1,0,0,0];
n_rightwall_face = [1,0,0,-6.8];
n_frontwall_face = [0,1,0,0];
n_behindwall_face = [0,1,0,-6.5];
n_obwall_face = [1,0,0,-3];
n_window = [0,1,0,-6.8];
n_face = [n_floor_face;n_ceiling_face;n_leftwall_face;n_rightwall_face;n_frontwall_face;n_behindwall_face];

% n_wall_upface = [0,0,1];
% n_wall_leftface = [-1,0,0];
% n_wall_rightface = [1,0,0];
%four points of the floor in the office;
vp_floor_face1 = [0,0,0];
vp_floor_face2 = [6.8,0,0];
vp_floor_face3 = [6.8,6.5,0];
vp_floor_face4 = [0,6.5,0];
p_floor = [vp_floor_face1;vp_floor_face2;vp_floor_face3;vp_floor_face4;vp_floor_face1];
plot3(p_floor(:,1),p_floor(:,2),p_floor(:,3),'black-','linewidth',2);
hold on;
%four points of the ceiling in the office;
vp_ceiling_face1 = [0,0,3.1];
vp_ceiling_face2 = [6.8,0,3.1];
vp_ceiling_face3 = [6.8,6.5,3.1];
vp_ceiling_face4 = [0,6.5,3.1];
p_ceiling = [vp_ceiling_face1;vp_ceiling_face2;vp_ceiling_face3;vp_ceiling_face4;vp_ceiling_face1];
plot3(p_ceiling(:,1),p_ceiling(:,2),p_ceiling(:,3),'-','linewidth',2);
hold on;
%four points of the leftwall_face in the office;
vp_leftwall_face1 = [0,0,0];
vp_leftwall_face2 = [0,6.5,0];
vp_leftwall_face3 = [0,6.5,3.1];
vp_leftwall_face4 = [0,0,3.1];
p_leftwall = [vp_leftwall_face1;vp_leftwall_face2;vp_leftwall_face3;vp_leftwall_face4;vp_leftwall_face1];
plot3(p_leftwall(:,1),p_leftwall(:,2),p_leftwall(:,3),'-','linewidth',2);
hold on;
%four points of the rightwall in the office;
vp_rightwall_face1 = [6.8,0,0];
vp_rightwall_face2 = [6.8,6.5,0];
vp_rightwall_face3 = [6.8,6.5,3.1];
vp_rightwall_face4 = [6.8,0,3.1];
p_rightwall= [vp_rightwall_face1;vp_rightwall_face2;vp_rightwall_face3;vp_rightwall_face4;vp_rightwall_face1];
plot3(p_rightwall(:,1),p_rightwall(:,2),p_rightwall(:,3),'-','linewidth',2);
hold on;
%four points of the front wall in the office;
vp_frontwall_face1 = [0,0,0];
vp_frontwall_face2 = [6.8,0,0];
vp_frontwall_face3 = [6.8,0,3.1];
vp_frontwall_face4 = [0,0,3.1];
p_frontwall = [vp_frontwall_face1;vp_frontwall_face2;vp_frontwall_face3;vp_frontwall_face4;vp_frontwall_face1];
plot3(p_frontwall(:,1),p_frontwall(:,2),p_frontwall(:,3),'-','linewidth',2);
hold on;
%four points of the behind wall in the office;
vp_behindwall_face1 = [0,6.5,0];
vp_behindwall_face2 = [6.8,6.5,0];
vp_behindwall_face3 = [6.8,6.5,3.1];
vp_behindwall_face4 = [0,6.5,3.1];
p_behindwall = [vp_behindwall_face1;vp_behindwall_face2;vp_behindwall_face3;vp_behindwall_face4;vp_behindwall_face1];
plot3(p_behindwall(:,1),p_behindwall(:,2),p_behindwall(:,3),'-','linewidth',2);
hold on;

%  vp_obwall_face1 = [3,2,0];
%  vp_obwall_face2 = [3,2,1];
%  vp_obwall_face3 = [3,6.5,1];
%  vp_obwall_face4 = [3,6.5,0];
%  p_obwall = [vp_obwall_face1;vp_obwall_face2;vp_obwall_face3;vp_obwall_face4;vp_obwall_face1];
%  plot3(p_obwall(:,1),p_obwall(:,2),p_obwall(:,3),'-','linewidth',2);
%  fill3(p_obwall(:,1),p_obwall(:,2),p_obwall(:,3),'g','linewidth',2)
%  hold on;
%  add Window 

% vp_window_face1 = [1.1,6.3,1.1];
% vp_window_face2 = [1.1,6.3,2.8];
% vp_window_face3 = [5.9,6.3,2.8];
% vp_window_face4 = [5.9,6.3,1.1];
% p_window = [vp_window_face1;vp_window_face2;vp_window_face3;vp_window_face4;vp_window_face1];
% plot3(p_window(:,1),p_window(:,2),p_window(:,3),'--','linewidth',2);
% hold on;



% vp_obwall2_face1 = [5,2,0];
% vp_obwall2_face2 = [5,2,2];
% vp_obwall2_face3 = [5,6.5,2];
% vp_obwall2_face4 = [5,6.5,0];
% p_obwall2 = [vp_obwall2_face1;vp_obwall2_face2;vp_obwall2_face3;vp_obwall2_face4;vp_obwall2_face1];
% plot3(p_obwall2(:,1),p_obwall2(:,2),p_obwall2(:,3),'-');
% fill3(p_obwall2(:,1),p_obwall2(:,2),p_obwall2(:,3),'g');
% hold on;

p_allface = [p_floor, p_ceiling, p_leftwall, p_rightwall,p_frontwall,p_behindwall];

%%
%frequency /wave length/power_TX
power_tx=0.1;%0.1w=���书��,20dBm  %ʵ�ʳ�����-15dbm
frequency=5.6*10^9;%Ƶ��
c=3e8;
wavelength=c/frequency;%����
reflect_time = 5;
num_antenna =1;% 64;
Ant_vec = [0,0,1];

%%
%the complex electric medium constant of concrert

permitivity_frontwall=6.4;  %�������
permitivity_behindwall=6.4;  %Զ�����
permitivity_floor=6.4;  %����
permitivity_ceiling=6.4;  %����
permitivity_leftwall=6.4;  %��ǽ��
permitivity_rightwall=6.4;  %��ǽ��
permitivity_obwall=6.4;  %��ǽ��
permitivity_window = 1.2;

conductivity_frontwall=10^(-2);  %�������
conductivity_behindwall=10^(-2);  %Զ�����
conductivity_floor=10^(-2);  %����
conductivity_ceiling=10^(-2);  %����
conductivity_leftwall=10^(-2);  %��ǽ��
conductivity_rightwall=10^(-2);  %��ǽ��
conductivity_obwall=10^(-2);  %��ǽ��
conductivity_window = 10^(-15);

e_floor=permitivity_floor-1j*60*conductivity_floor*wavelength;  %����
e_ceiling=permitivity_ceiling-1j*60*conductivity_ceiling*wavelength;  %����
e_leftwall=permitivity_leftwall-1j*60*conductivity_leftwall*wavelength;  %��ǽ��
e_rightwall=conductivity_rightwall-1j*60*conductivity_rightwall*wavelength;  %��ǽ��
e_frontwall=permitivity_frontwall-1j*60*conductivity_frontwall*wavelength;  %�������
e_behindwall=permitivity_behindwall-1j*60*conductivity_behindwall*wavelength;  %Զ�����
%e_obwall=permitivity_obwall-1j*60*conductivity_obwall*wavelength;  %�м�ǽ��
%e_window = permitivity_window-1j*60*conductivity_window*wavelength;  %window


e_face = [e_floor,e_ceiling,e_leftwall,e_rightwall,e_frontwall,e_behindwall];
    

%%
%progress bar init
hwait=waitbar(0,'��ȴ�>>>>>>>>');  %����������
number=0;  %����������

%%
%location of tx and rx ,by the way load the antenna gain

for  u = 1:num_antenna
Tx1 = [2.4,1.0,2.1];
Rx1 = [3.6,4.862+0.026*(u-1),2.1];
Tx = Tx1;
Rx = Rx1;
tx = Tx(:,1); %���͵�
ty = Tx(:,2);
tz = Tx(:,3);
rx = Rx(:,1);  %���յ�
ry = Rx(:,2);
rz = Rx(:,3);

%%
%draw the TX and Rx
plot3(tx,ty,tz,'r.','MarkerSize',20,'linewidth',2)
plot3(rx,ry,rz,'g.','MarkerSize',20,'linewidth',2)
plot3([tx,tx],[ty,ty],[0,tz],'k','linewidth',2)
plot3([tx,tx-0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',2)
plot3([tx,tx+0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',2)
plot3([rx,rx],[ry,ry],[0,rz],'k','linewidth',2)
plot3([rx,rx-0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',2)
plot3([rx,rx+0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',2)


%%
%load the antenna gain
tx_gain=xlsread('GTS RA-L4959DP 1512001����ͼ.xlsx');
tx_gain_horizontal_angle = tx_gain(:,1);
tx_gain_horizontal = tx_gain(:,2);%dB
tx_gain_vertical_angle = tx_gain(:,3);
tx_gain_vertical = tx_gain(:,4);%dB

%%
%angel of emit ray

%  delta_theta = sqrt(3)*Rcollect*180/(pi*l); angle interval;needed to be
%  verify
%�Ƿ��������Ծ��֣�


delta_theta = 10;
num_theta = floor(180/delta_theta);

theta = zeros(1,num_theta);
delta_phi = zeros(1,num_theta);
num_phi = zeros(1,num_theta);

n = 1:num_theta-1;
theta(n) = delta_theta*n;
delta_phi(n) = delta_theta./sind(theta(n));
num_phi(n) = floor(360./delta_phi(n));


theta(num_theta) = delta_theta*num_theta;
if theta(num_theta) == 180
    delta_phi(num_theta) = 1;
    num_phi(num_theta) = 1;
else
    delta_phi(num_theta) = delta_theta/sind(theta(num_theta));
    num_phi(num_theta) = floor(360/delta_phi(num_theta));
end


phi = zeros(num_theta,max(num_phi));
vx = zeros(num_theta,max(num_phi));
vy = zeros(num_theta,max(num_phi));
vz = zeros(num_theta,max(num_phi));
for n = 1:num_theta
    for m = 1:num_phi(n)
        phi(n,m) = m*delta_phi(n);
        vx(n,m) = sind(theta(n))*cosd(phi(n,m));
        vy(n,m) = sind(theta(n))*sind(phi(n,m));
        vz(n,m) = cosd(theta(n));
    end
end

num_ray = sum(num_phi);
pt_ray = power_tx;
% the first version is power_tx/num_ray,
%it is a mistake,because the E-field is radiation energy, not divided by rays.
%and the divided ray is to get the accurate received rays number.

%%


%% gain of each ray

gain_tx = zeros(num_theta,max(num_phi));
gain_theta = zeros(1,num_theta);
gain_phi = zeros(1,max(num_phi));
for n = 1:num_theta
    for m = 1:num_phi(n)
        [a,b] = find(abs(tx_gain_vertical_angle'-theta(n)-0.01)==min(abs(tx_gain_vertical_angle'-theta(n)-0.01)));
        gain_theta(1,n) = tx_gain_vertical(b,a);
        [a,b] = find(abs(tx_gain_horizontal_angle'-phi(n)-0.01)==min(abs(tx_gain_horizontal_angle'-phi(n)-0.01)));
        gain_phi(1,m) = tx_gain_horizontal(b,a);
        gain_tx(n,m) = gain_theta(1,n)+gain_phi(1,m);
    end
end

%% tracing
parameterR = cell(num_theta,max(num_phi));
%pr_temp = cell(1,num_theta*max(num_phi)/10);
point = cell(num_theta,max(num_phi));
num_ray_R = 1;
for n = 1:num_theta
    for m = 1:num_phi(n)
        GainT = 10^(gain_tx(n,m)/10);
        number = number+1;
        number_bar = num_ray*num_antenna;
        if number_bar-number <=100
            waitbar(number/number_bar,hwait,'completed');
        else
            str=['running',num2str(100*number/number_bar),'%'];
            waitbar(number/number_bar,hwait,str);
        end
        
        v1 = vx(n,m); v2 = vy(n,m);v3 = vz(n,m);
        t1 = tx; t2 = ty; t3 = tz;
        %% judge the los
        pathlength = []; rcoe = [];
        intersect_index = intersection_judge(v1,v2,v3,t1,t2,t3,rx,ry,rz,n_face,p_allface);
        if intersect_index == 1
            parameterR{n,m} = receive_LOS(v1,v2,v3,t1,t2,t3,rx,ry,rz,delta_theta,wavelength,GainT,n,m,vx,vy,vz);  %����ж��м��Ƿ����ڵ���
            if isempty(parameterR{n,m})==0
                pr_temp{1,num_ray_R}=parameterR{n,m}; %pr_temp �ݴ���յ�����
                num_ray_R = num_ray_R+1;
                plot3([tx,rx],[ty,ry],[tz,rz]);
                hold on;
                continue;
            end
        end
        %% reflect and receive
        pathlength = zeros(1,reflect_time);
 %       rcoe = zeros(1,reflect_time);
        rp = cell(1,reflect_time);
        for i = 1:reflect_time
            point{n,m}{1,i} = face_intersected(v1,v2,v3,t1,t2,t3,n_face,p_allface);
            rp{1,i} = point{n,m}{1,i};
            if isnan(rp{1,i}(1,4))
                continue
            end
            if isempty(rp{1,i}) == 1
                continue
            end
            [newray,rcoe(1,i)] =Add_polarity_reflected(rp{1,i},v1,v2,v3,n_face,e_face);
            t1 = rp{1,i}(1,1); t2 = rp{1,i}(1,2); t3 = rp{1,i}(1,3);
            pathlength(1,i) = rp{1,i}(1,4);
            v1 = newray(1,1); v2 = newray(1,2); v3 = newray(1,3);
            if isempty(parameterR{n,m}) == 1;
                intersect_index = intersection_judge(v1,v2,v3,t1,t2,t3,rx,ry,rz,n_face,p_allface);
                if intersect_index == 1
                    parameterR{n,m} = receive(t1,t2,t3,rx,ry,rz,newray,delta_theta,wavelength,pathlength,rcoe,GainT,n,m,vx,vy,vz);
                    if isempty(parameterR{n,m}) == 0
                        pr_temp{1,num_ray_R} = parameterR{n,m};
                        num_ray_R = num_ray_R+1;
                        x_inter = zeros(1,i);
                        y_inter = zeros(1,i);
                        z_inter = zeros(1,i);
                        for t = 1:i
                            x_inter(1,t) = rp{1,t}(1,1);
                            y_inter(1,t) = rp{1,t}(1,2);
                            z_inter(1,t) = rp{1,t}(1,3);
                        end
                        plot3([tx,x_inter,rx],[ty,y_inter,ry],[tz,z_inter,rz]);
                        hold on;
                        continue;
                    else
                    end
                end
            end
        end
        
        %% receiving gain
        
    end
end
GainthetaR = 1;

E_loss = zeros(1,num_ray_R-1);

time_delay = zeros(1,num_ray_R-1);
AOA_vec = zeros(3,num_ray_R-1);
AOD_vec = zeros(3,num_ray_R-1);
for q = 1:num_ray_R-1
    path_received_temp = pr_temp{1,q};%��������õ���pr0��ֵ��pr0�У�u��ָ��һ����������,pָ������һ����������,q�Ǵӷ���㵽���յ�֮��ÿ��һ����������Ŀ������㵽�㣬����qΪ1��m��ָ���յ������߸���,pr�ڲ��Ĳ�����receive1�еĲ�����
    E_loss(1,q) = path_received_temp(1,1);%E_loss��ָû�г��Է���(�ź�)���ʵģ��ڸ���·������ĵĳ�ǿ�����źţ��Ĳ�������������    
    time_delay(1,q) = path_received_temp(1,2);%time_delay�����ߵĵ���ʱ��
    AOA_vec(1,q) = path_received_temp(1,3);
    AOA_vec(2,q) = path_received_temp(1,4);
    AOA_vec(3,q) = path_received_temp(1,5);
    AOD_vec(1,q) = path_received_temp(1,6);
    AOD_vec(2,q) = path_received_temp(1,7);
    AOD_vec(3,q) = path_received_temp(1,8);
end
E_received = sqrt(GainthetaR)*sqrt(pt_ray)*E_loss;%E_received���������߽��յĵ糡����������
E_loss_abs = abs(E_loss);%E_loss_abs:����糡�Ĵ�С
%pr21{u,p}(q,m)=GainthetaR*pt0*2*pi/l.*E_loss_abs{u,p}(q,m)^2;%ÿ�����ߵĹ���   ��Ҫ�����߷���������������棬dbҪ���ɱ���
power_received_ray = GainthetaR*pt_ray.*E_loss_abs.^2*2*pi/wavelength;%ÿ�����ߵĽ��չ��ʣ�Wireless Insite������ͨ�����ϵ��ɲ�ͬ��Ŀǰ�����ϵ�����
power_received_ray_dB = 10*log10(power_received_ray);%ÿ�����ߵĽ��չ��ʣ���λdbm
pathloss_ray = pt_ray./power_received_ray;%ÿ�����ߵ�·�����
pathloss_ray_dB = 10*log10(pathloss_ray);%ÿ������·�����dB



E_loss_sum = sum(E_loss);%�ܹ��ĳ�ǿ��ģ�
E_sum = sum(E_received);%�ܳ�ǿ
power_received_sum=sum(power_received_ray);%�ܽ��չ���
power_received_sum_dB = 10*log10(power_received_sum);
mean_timedelay=sum(power_received_ray.*time_delay);%
mean_timedelay_2pow=sum(power_received_ray.*time_delay.^2);%
tave=mean_timedelay/power_received_sum;%
et=mean_timedelay_2pow/power_received_sum ;%;
RMS=sqrt(et-tave^2);%�������ʱ��
los_path=norm([rx-tx,ry-ty,rz-tz]);
E_loss_los = wavelength/(4*pi*los_path)*exp(-1j*2*pi*los_path/wavelength);%ֱ�ﾶ��ǿ���//��Ҫ����ֱ�ﾶ�ķ�������
E_los = sqrt(pt_ray)*sqrt(GainthetaR)*E_loss_los;%ֱ�ﾶ

k=(abs(E_los))^2/(abs(power_received_sum))^2;%??????
hmatrix=sum(E_loss);%��������Ԫ��????????
K_dB=10*log10(k);%K����
pathloss_sum = power_tx./power_received_sum;%·����� ��������
pathloss_sum_dB=10*log10(power_tx./power_received_sum);%·�����

save(['indoor_Rv0.2_antenna',num2str(u),'.mat']);
end
toc;