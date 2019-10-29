%%实验室仿真有效性验证；输入参数：1、各个面和顶点参数；2、天线的各方向增益；3、发射功率；4、频率；5、发射点接收点的位置和高度；6、各个面的复介电常数；

clear
tic;
%%
%%
%Input;
height = 3.1; width = 6.8; length = 6.3;
n_floor_face = [0,0,1,0];
n_ceiling_face = [0,0,1,-height];
n_leftwall_face = [1,0,0,0];
n_rightwall_face = [1,0,0,-width];
n_frontwall_face = [0,1,0,0];
n_behindwall_face = [0,1,0,-length];

%height_obwall = 1;
n_obwall_face = [1,0,0,-3.6];
n_obwall2_face = [1,0,0,-3.7];
n_obwall3_face = [0,1,0,-2];
n_obwall4_face = [0,0,1,-1];
n_window = [0,1,0,-6.8];

n_desk1_face1 = [0,1,0,-2];
n_desk1_face2 = [0,0,1,-1.5];
n_desk1_face3 = [0,0,1,-0.7];

n_desk2_face1 = [0,1,0,-3];
n_desk2_face2 = [0,0,1,-1];
n_desk2_face3 = [1,0,0,-4.8];
n_desk2_face4 = [0,1,0,-4];

n_bookcase_face1 = [0,1,0,-4.8];
n_bookcase_face2 = [0,0,1,-2];
n_bookcase_face3 = [1,0,0,-4.1];
n_bookcase_face4 = [1,0,0,-3.7];

n_desk3_face1 = [1,0,0,-4.2];
n_desk3_face2 = [0,0,1,-1.5];
n_desk3_face3 = [0,0,1,-0.7];

n_face = [n_window;n_floor_face;n_ceiling_face;n_leftwall_face;n_rightwall_face;n_frontwall_face;n_behindwall_face;...
    n_obwall_face;n_obwall2_face;n_obwall3_face;n_obwall4_face;n_desk1_face1;n_desk1_face2;n_desk1_face3;...
    n_desk2_face1;n_desk2_face2;n_desk2_face3;n_desk2_face4;...
    n_bookcase_face1;n_bookcase_face2;n_bookcase_face3;n_bookcase_face4;...
    n_desk3_face1;n_desk3_face2;n_desk3_face3];

%height = 3.1; width = 6.8; length = 6.3;
%four points of the floor in the office;
vp_floor_face1 = [0,0,0];
vp_floor_face2 = [width,0,0];
vp_floor_face3 = [width,length,0];
vp_floor_face4 = [0,length,0];
p_floor = [vp_floor_face1;vp_floor_face2;vp_floor_face3;vp_floor_face4;vp_floor_face1];
plot3(p_floor(:,1),p_floor(:,2),p_floor(:,3),'black-','linewidth',2);
hold on;
%four points of the ceiling in the office;
vp_ceiling_face1 = [0,0,height];
vp_ceiling_face2 = [width,0,height];
vp_ceiling_face3 = [width,length,height];
vp_ceiling_face4 = [0,length,height];
p_ceiling = [vp_ceiling_face1;vp_ceiling_face2;vp_ceiling_face3;vp_ceiling_face4;vp_ceiling_face1];
plot3(p_ceiling(:,1),p_ceiling(:,2),p_ceiling(:,3),'-','linewidth',2);
hold on;
%four points of the leftwall_face in the office;
vp_leftwall_face1 = [0,0,0];
vp_leftwall_face2 = [0,length,0];
vp_leftwall_face3 = [0,length,height];
vp_leftwall_face4 = [0,0,height];
p_leftwall = [vp_leftwall_face1;vp_leftwall_face2;vp_leftwall_face3;vp_leftwall_face4;vp_leftwall_face1];
plot3(p_leftwall(:,1),p_leftwall(:,2),p_leftwall(:,3),'-','linewidth',2);
hold on;
%four points of the rightwall in the office;
vp_rightwall_face1 = [width,0,0];
vp_rightwall_face2 = [width,length,0];
vp_rightwall_face3 = [width,length,height];
vp_rightwall_face4 = [width,0,height];
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
vp_behindwall_face1 = [0,6.3,0];
vp_behindwall_face2 = [6.8,6.3,0];
vp_behindwall_face3 = [6.8,6.3,3.1];
vp_behindwall_face4 = [0,6.3,3.1];
p_behindwall = [vp_behindwall_face1;vp_behindwall_face2;vp_behindwall_face3;vp_behindwall_face4;vp_behindwall_face1];
plot3(p_behindwall(:,1),p_behindwall(:,2),p_behindwall(:,3),'-','linewidth',2);
hold on;

vp_obwall_face1 = [3.6,2,0];
vp_obwall_face2 = [3.6,2,1];
vp_obwall_face3 = [3.6,6.3,1];
vp_obwall_face4 = [3.6,6.3,0];
p_obwall = [vp_obwall_face1;vp_obwall_face2;vp_obwall_face3;vp_obwall_face4;vp_obwall_face1];
plot3(p_obwall(:,1),p_obwall(:,2),p_obwall(:,3),'-','linewidth',2);
fill3(p_obwall(:,1),p_obwall(:,2),p_obwall(:,3),'g','linewidth',2)
hold on;


vp_obwall2_face1 = [3.7,2,0];
vp_obwall2_face2 = [3.7,2,1];
vp_obwall2_face3 = [3.7,6.3,1];
vp_obwall2_face4 = [3.7,6.3,0];
p_obwall2 = [vp_obwall2_face1;vp_obwall2_face2;vp_obwall2_face3;vp_obwall2_face4;vp_obwall2_face1];
plot3(p_obwall2(:,1),p_obwall2(:,2),p_obwall2(:,3),'-','linewidth',2);
fill3(p_obwall2(:,1),p_obwall2(:,2),p_obwall2(:,3),'g','linewidth',2)
hold on;

vp_obwall3_face1 = [3.7,2,0];
vp_obwall3_face2 = [3.7,2,1];
vp_obwall3_face3 = [3.6,2,1];
vp_obwall3_face4 = [3.6,2,0];
p_obwall3 = [vp_obwall3_face1;vp_obwall3_face2;vp_obwall3_face3;vp_obwall3_face4;vp_obwall3_face1];
plot3(p_obwall3(:,1),p_obwall3(:,2),p_obwall3(:,3),'-','linewidth',2);
fill3(p_obwall3(:,1),p_obwall3(:,2),p_obwall3(:,3),'g','linewidth',2)
hold on;

vp_obwall4_face1 = [3.6,2,1];
vp_obwall4_face2 = [3.7,2,1];
vp_obwall4_face3 = [3.7,6.3,1];
vp_obwall4_face4 = [3.6,6.3,1];
p_obwall4 = [vp_obwall4_face1;vp_obwall4_face2;vp_obwall4_face3;vp_obwall4_face4;vp_obwall4_face1];
plot3(p_obwall4(:,1),p_obwall4(:,2),p_obwall4(:,3),'-','linewidth',2);
fill3(p_obwall4(:,1),p_obwall4(:,2),p_obwall4(:,3),'g','linewidth',2)
hold on;
%  add Window

vp_window_face1 = [1.1,6.3,1.1];
vp_window_face2 = [1.1,6.3,2.8];
vp_window_face3 = [5.9,6.3,2.8];
vp_window_face4 = [5.9,6.3,1.1];
p_window = [vp_window_face1;vp_window_face2;vp_window_face3;vp_window_face4;vp_window_face1];
plot3(p_window(:,1),p_window(:,2),p_window(:,3),'--','linewidth',2);
hold on;





vp_desk1_face1_1 = [1.5,2,0];
vp_desk1_face1_2 = [1.5,2,1.5];
vp_desk1_face1_3= [0,2,1.5];
vp_desk1_face1_4= [0,2,0];
p_desk1 = [vp_desk1_face1_1;vp_desk1_face1_2;vp_desk1_face1_3;vp_desk1_face1_4;vp_desk1_face1_1];
plot3(p_desk1(:,1),p_desk1(:,2),p_desk1(:,3),'-','Linewidth',2);
fill3(p_desk1(:,1),p_desk1(:,2),p_desk1(:,3),'g');
hold on;

vp_desk1_face2_1 = [1.5,2,1.5];
vp_desk1_face2_2 = [1.5,6.3,1.5];
vp_desk1_face2_3= [0,6.3,1.5];
vp_desk1_face2_4= [0,2,1.5];
p_desk1_face2 = [vp_desk1_face2_1;vp_desk1_face2_2;vp_desk1_face2_3;vp_desk1_face2_4;vp_desk1_face2_1];
plot3(p_desk1_face2(:,1),p_desk1_face2(:,2),p_desk1_face2(:,3),'-','Linewidth',2);
fill3(p_desk1_face2(:,1),p_desk1_face2(:,2),p_desk1_face2(:,3),'g');
hold on;

vp_desk1_face3_1 = [1.5,2,0.7];
vp_desk1_face3_2 = [1.5,6.3,0.7];
vp_desk1_face3_3= [0,6.3,0.7];
vp_desk1_face3_4= [0,2,0.7];
p_desk1_face3 = [vp_desk1_face3_1;vp_desk1_face3_2;vp_desk1_face3_3;vp_desk1_face3_4;vp_desk1_face3_1];
plot3(p_desk1_face3(:,1),p_desk1_face3(:,2),p_desk1_face3(:,3),'-','Linewidth',2);
fill3(p_desk1_face3(:,1),p_desk1_face3(:,2),p_desk1_face3(:,3),'g');
hold on;

vp_desk2_face1_1 = [6.8,3.0,0];
vp_desk2_face1_2 = [6.8,3.0,1];
vp_desk2_face1_3= [4.8,3.0,1];
vp_desk2_face1_4= [4.8,3.0,0];
p_desk2_face1 = [vp_desk2_face1_1;vp_desk2_face1_2;vp_desk2_face1_3;vp_desk2_face1_4;vp_desk2_face1_1];
plot3(p_desk2_face1(:,1),p_desk2_face1(:,2),p_desk2_face1(:,3),'-','Linewidth',2);
fill3(p_desk2_face1(:,1),p_desk2_face1(:,2),p_desk2_face1(:,3),'g');
hold on;

vp_desk2_face2_1 = [6.8,3.0,1];
vp_desk2_face2_2 = [6.8,4.0,1];
vp_desk2_face2_3= [4.8,4.0,1];
vp_desk2_face2_4= [4.8,3.0,1];
p_desk2_face2 = [vp_desk2_face2_1;vp_desk2_face2_2;vp_desk2_face2_3;vp_desk2_face2_4;vp_desk2_face2_1];
plot3(p_desk2_face2(:,1),p_desk2_face2(:,2),p_desk2_face2(:,3),'-','Linewidth',2);
fill3(p_desk2_face2(:,1),p_desk2_face2(:,2),p_desk2_face2(:,3),'g');
hold on;

vp_desk2_face3_1 = [4.8,3.0,0];
vp_desk2_face3_2 = [4.8,3.0,1];
vp_desk2_face3_3= [4.8,4.0,1];
vp_desk2_face3_4= [4.8,4.0,0];
p_desk2_face3 = [vp_desk2_face3_1;vp_desk2_face3_2;vp_desk2_face3_3;vp_desk2_face3_4;vp_desk2_face3_1];
plot3(p_desk2_face3(:,1),p_desk2_face3(:,2),p_desk2_face3(:,3),'-','Linewidth',2);
fill3(p_desk2_face3(:,1),p_desk2_face3(:,2),p_desk2_face3(:,3),'g');
hold on;

vp_desk2_face4_1 = [6.8,4.0,0];
vp_desk2_face4_2 = [6.8,4.0,1];
vp_desk2_face4_3= [4.8,4.0,1];
vp_desk2_face4_4= [4.8,4.0,0];
p_desk2_face4 = [vp_desk2_face4_1;vp_desk2_face4_2;vp_desk2_face4_3;vp_desk2_face4_4;vp_desk2_face4_1];
plot3(p_desk2_face4(:,1),p_desk2_face4(:,2),p_desk2_face4(:,3),'-','Linewidth',2);
fill3(p_desk2_face4(:,1),p_desk2_face4(:,2),p_desk2_face4(:,3),'g');
hold on;

vp_bookcase_face1_1 = [4.1,4.8,0];
vp_bookcase_face1_2 = [4.1,4.8,2];
vp_bookcase_face1_3= [3.7,4.8,2];
vp_bookcase_face1_4= [3.7,4.8,0];
p_bookcase_face1 = [vp_bookcase_face1_1;vp_bookcase_face1_2;vp_bookcase_face1_3;vp_bookcase_face1_4;vp_bookcase_face1_1];
plot3(p_bookcase_face1(:,1),p_bookcase_face1(:,2),p_bookcase_face1(:,3),'-','Linewidth',2);
fill3(p_bookcase_face1(:,1),p_bookcase_face1(:,2),p_bookcase_face1(:,3),'g');
hold on;

vp_bookcase_face2_1 = [4.1,4.8,2];
vp_bookcase_face2_2 = [4.1,6.3,2];
vp_bookcase_face2_3= [3.7,6.3,2];
vp_bookcase_face2_4= [3.7,4.8,2];
p_bookcase_face2 = [vp_bookcase_face2_1;vp_bookcase_face2_2;vp_bookcase_face2_3;vp_bookcase_face2_4;vp_bookcase_face2_1];
plot3(p_bookcase_face2(:,1),p_bookcase_face2(:,2),p_bookcase_face2(:,3),'-','Linewidth',2);
fill3(p_bookcase_face2(:,1),p_bookcase_face2(:,2),p_bookcase_face2(:,3),'g');
hold on;

vp_bookcase_face3_1 = [4.1,6.3,0];
vp_bookcase_face3_2 = [4.1,6.3,2];
vp_bookcase_face3_3= [4.1,4.8,2];
vp_bookcase_face3_4= [4.1,4.8,0];
p_bookcase_face3 = [vp_bookcase_face3_1;vp_bookcase_face3_2;vp_bookcase_face3_3;vp_bookcase_face3_4;vp_bookcase_face3_1];
plot3(p_bookcase_face3(:,1),p_bookcase_face3(:,2),p_bookcase_face3(:,3),'-','Linewidth',2);
fill3(p_bookcase_face3(:,1),p_bookcase_face3(:,2),p_bookcase_face3(:,3),'g');
hold on;

vp_bookcase_face4_1 = [3.7,4.8,1];
vp_bookcase_face4_2 = [3.7,4.8,2];
vp_bookcase_face4_3= [3.7,6.3,2];
vp_bookcase_face4_4= [3.7,6.3,1];
p_bookcase_face4 = [vp_bookcase_face4_1;vp_bookcase_face4_2;vp_bookcase_face4_3;vp_bookcase_face4_4;vp_bookcase_face4_1];
plot3(p_bookcase_face4(:,1),p_bookcase_face4(:,2),p_bookcase_face4(:,3),'-','Linewidth',2);
fill3(p_bookcase_face4(:,1),p_bookcase_face4(:,2),p_bookcase_face4(:,3),'g');
hold on;

vp_desk3_face1_1 = [4.2,0,0];
vp_desk3_face1_2 = [4.2,0,1.5];
vp_desk3_face1_3= [4.2,1,1.5];
vp_desk3_face1_4= [4.2,1,0];
p_desk3_face1 = [vp_desk3_face1_1;vp_desk3_face1_2;vp_desk3_face1_3;vp_desk3_face1_4;vp_desk3_face1_1];
plot3(p_desk3_face1(:,1),p_desk3_face1(:,2),p_desk3_face1(:,3),'-','Linewidth',2);
fill3(p_desk3_face1(:,1),p_desk3_face1(:,2),p_desk3_face1(:,3),'g');
hold on;

vp_desk3_face2_1 = [4.2,0,1.5];
vp_desk3_face2_2 = [6.8,0,1.5];
vp_desk3_face2_3= [6.8,1,1.5];
vp_desk3_face2_4= [4.2,1,1.5];
p_desk3_face2 = [vp_desk3_face2_1;vp_desk3_face2_2;vp_desk3_face2_3;vp_desk3_face2_4;vp_desk3_face2_1];
plot3(p_desk3_face2(:,1),p_desk3_face2(:,2),p_desk3_face2(:,3),'-','Linewidth',2);
fill3(p_desk3_face2(:,1),p_desk3_face2(:,2),p_desk3_face2(:,3),'g');
hold on;

vp_desk3_face3_1 = [4.2,0,0.7];
vp_desk3_face3_2 = [6.8,0,0.7];
vp_desk3_face3_3= [6.8,1,0.7];
vp_desk3_face3_4= [4.2,1,0.7];
p_desk3_face3 = [vp_desk3_face3_1;vp_desk3_face3_2;vp_desk3_face3_3;vp_desk3_face3_4;vp_desk3_face3_1];
plot3(p_desk3_face3(:,1),p_desk3_face3(:,2),p_desk3_face3(:,3),'-','Linewidth',2);
fill3(p_desk3_face3(:,1),p_desk3_face3(:,2),p_desk3_face3(:,3),'g');
hold on;

xlabel('Length (m)');
ylabel('Width (m)');
zlabel('Height (m)');

p_allface = [p_window,p_floor, p_ceiling, p_leftwall, p_rightwall,p_frontwall,p_behindwall...
    ,p_obwall,p_obwall2,p_obwall3,p_obwall4,p_desk1,p_desk1_face2,p_desk1_face3...
    ,p_desk2_face1,p_desk2_face2,p_desk2_face3,p_desk2_face4...
    ,p_bookcase_face1,p_bookcase_face2,p_bookcase_face3,p_bookcase_face4...
    ,p_desk3_face1,p_desk3_face2,p_desk3_face3];

%%
%frequency /wave length/power_TX
power_tx=100;%0.1w=发射功率,20dBm  %实际场景中-15dbm
enta = 377;%空间中自由损耗
E_tx = sqrt((power_tx * enta)/(2*pi));
Ant_vec = [0,0,1];
frequency=5.6*10^9;%频率
c=3e8;
wavelength=c/frequency;%波长
reflect_time = 5;
num_antenna =1;


%%
%the complex electric medium constant of concrert

permitivity_frontwall=6.4;  %近轴截面
permitivity_behindwall=6.4;  %远轴截面
permitivity_floor=6.4;  %地面
permitivity_ceiling=6.4;  %顶面
permitivity_leftwall=6.4;  %左墙面
permitivity_rightwall=6.4;  %右墙面
permitivity_obwall=6.4;  %右墙面
permitivity_window = 1.2;

conductivity_frontwall=10^(-2);  %近轴截面
conductivity_behindwall=10^(-2);  %远轴截面
conductivity_floor=10^(-2);  %地面
conductivity_ceiling=10^(-2);  %顶面
conductivity_leftwall=10^(-2);  %左墙面
conductivity_rightwall=10^(-2);  %右墙面
conductivity_obwall=10^(-2);  %右墙面
conductivity_window = 10^(-15);

e_floor=permitivity_floor-1j*60*conductivity_floor*wavelength;  %地面
e_ceiling=permitivity_ceiling-1j*60*conductivity_ceiling*wavelength;  %顶面
e_leftwall=permitivity_leftwall-1j*60*conductivity_leftwall*wavelength;  %左墙面
e_rightwall=conductivity_rightwall-1j*60*conductivity_rightwall*wavelength;  %右墙面
e_frontwall=permitivity_frontwall-1j*60*conductivity_frontwall*wavelength;  %近轴截面
e_behindwall=permitivity_behindwall-1j*60*conductivity_behindwall*wavelength;  %远轴截面
e_obwall=permitivity_obwall-1j*60*conductivity_obwall*wavelength;  %中间墙面
e_window = permitivity_window-1j*60*conductivity_window*wavelength;  %window


e_face = [e_window,e_floor,e_ceiling,e_leftwall,e_rightwall,e_frontwall,e_behindwall,e_obwall,e_obwall,e_obwall,e_obwall...
    ,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall,e_obwall];
    

%%
%progress bar init
hwait=waitbar(0,'请等待>>>>>>>>');  %进度条设置
number=0;  %进度条设置

%%
%location of tx and rx ,by the way load the antenna gain
for  u = 1:num_antenna
Tx1 = [3.6,1.0,2.1];
Rx1 = [3.6,4.38+0.03*(u-1),2.1];
Tx = Tx1;
Rx = Rx1;
tx = Tx(:,1); %发送点
ty = Tx(:,2);
tz = Tx(:,3);
rx = Rx(:,1);  %接收点
ry= Rx(:,2);
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
tx_gain=xlsread('GTS RA-L4959DP 1512001方向图.xlsx');
tx_gain_horizontal_angle = tx_gain(:,1);
tx_gain_horizontal = tx_gain(:,2);%dB
tx_gain_vertical_angle = tx_gain(:,3);
tx_gain_vertical = tx_gain(:,4);%dB

%%
%angel of emit ray

%  delta_theta = sqrt(3)*Rcollect*180/(pi*l); angle interval;needed to be
%  verify
%是否这样可以均分？


delta_theta = 2;
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
        E_vec = [sind(theta(n)+90)*cosd(phi(n,m)),sind(theta(n)+90)*sind(phi(n,m)),cosd(theta(n)+90)];
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
        gain_theta(1,n) = tx_gain_vertical(b,a);% theta 是垂直面的角度,即射线与（0，0，1）之间的夹角（360范围，0-180,180-360是对称的）
        [a,b] = find(abs(tx_gain_horizontal_angle'-phi(n)-0.01)==min(abs(tx_gain_horizontal_angle'-phi(n)-0.01)));
        gain_phi(1,m) = tx_gain_horizontal(b,a);% phi是水平面的角度，即射线与（1，0，0）之间的夹角（360范围，同时可以发现0-180和180-360的增益是对称的）
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
        %GainT_theta = 10^(gain_theta(1,n)/10);
        %GainT_phi = 10^(gain_phi(1,m)/10);
        GainT = sqrt(10^(gain_tx(n,m)/10));
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
        intersect_flag = intersection_judge(v1,v2,v3,t1,t2,t3,rx,ry,rz,n_face,p_allface);
        if intersect_flag == 1
            parameterR{n,m} = receive_LOS(v1,v2,v3,t1,t2,t3,rx,ry,rz,delta_theta,wavelength,GainT,n,m,vx,vy,vz,E_tx,E_vec);  %如何判断中间是否有遮挡物
            if isempty(parameterR{n,m})==0
                pr_temp{1,num_ray_R}=parameterR{n,m}; %pr_temp 暂存接收的数据
                num_ray_R = num_ray_R+1;
                plot3([tx,rx],[ty,ry],[tz,rz]);
                hold on;
                continue;
            end
        end
        %% reflect and receive
%        pathlength = zeros(1,reflect_time);
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
            [newray,rcoe_ver(i,:),rcoe_para(i,:),parallel_ref(i,:),vertical_ref(i,:)] = reflected_polarity(rp{1,i},v1,v2,v3,n_face,e_face);
            t1 = rp{1,i}(1,1); t2 = rp{1,i}(1,2); t3 = rp{1,i}(1,3);
            pathlength(1,i) = rp{1,i}(1,4);
            v1 = newray(1,1); v2 = newray(1,2); v3 = newray(1,3);
            if isempty(parameterR{n,m}) == 1;
                intersect_flag = intersection_judge(v1,v2,v3,t1,t2,t3,rx,ry,rz,n_face,p_allface);
                if intersect_flag == 1
                    parameterR{n,m} = receive_divided(t1,t2,t3,rx,ry,rz,newray,delta_theta,wavelength,pathlength,rcoe_ver,rcoe_para,parallel_ref,vertical_ref,GainT,vx(n,m),vy(n,m),vz(n,m),E_tx,E_vec);
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

E_received = zeros(3,num_ray_R-1);

time_delay = zeros(1,num_ray_R-1);
Arrived_vec = zeros(3,num_ray_R-1);
Departure_vec = zeros(3,num_ray_R-1);
for q = 1:num_ray_R-1
    path_received_temp = pr_temp{1,q};%缓存上面得到的pr0的值，pr0中，u是指哪一根发射天线,p指的是哪一根接收天线,q是从发射点到接收点之间每隔一定距离点的数目，仿真点到点，所以q为1，m是指接收到的天线个数,pr内部的参数见receive1中的参数；
    if path_received_temp(1,11) == 0
        E_los = path_received_temp(1,1:3);
        E_los_abs = abs(sqrt(E_los(1,1).^2+E_los(1,2).^2+E_los(1,3).^2));
        time_los = path_received_temp(1,4);
        Arrived_los_vec(1:3,1) = path_received_temp(1,5:7);
        Departure_los_vec(1:3,1) = path_received_temp(1,8:10);
    end
    E_received(1:3,q) = path_received_temp(1,1:3);%E_loss是指没有乘以发射(信号)功率的，在各个路径上损耗的场强（即信号）的参数；（复数）    
    time_delay(1,q) = path_received_temp(1,4);%time_delay：射线的到达时延
    Arrived_vec(1:3,q) = path_received_temp(1,5:7);
    Departure_vec(1:3,q) = path_received_temp(1,8:10);
    
end
E_received_abs= abs(sqrt(E_received(1,:).^2+E_received(2,:).^2+E_received(3,:).^2));%E_received大小：单根射线接收的电场；（复数）
%E_received_abs = abs(E_received(3,:));
%pr21{u,p}(q,m)=GainthetaR*pt0*2*pi/l.*E_loss_abs{u,p}(q,m)^2;%每根射线的功率   需要乘天线发射增益与接收增益，db要换成倍数
power_received_ray = E_received_abs.^2*wavelength^2/(8*pi*enta);%每根天线的接收功率（Wireless Insite和无线通信书上的由不同，目前按书上的来）
power_received_ray_abs = abs(power_received_ray);
power_received_ray_dB = 10*log10(power_received_ray_abs);%每根天线的接收功率，单位dbm
pathloss_ray = pt_ray./power_received_ray_abs;%每根射线的路径损耗
pathloss_ray_dB = 10*log10(pathloss_ray);%每根射线路径损耗dB


E_sum(1:3,1) = sum(E_received(1:3,:),2);%总场强
%E_sum_abs = abs(sqrt(E_sum(1,:).^2+E_sum(2,:).^2+E_sum(3,:).^2));
E_sum_abs = abs(E_sum);
power_received_sum=sum(power_received_ray);%总接收功率
power_received_sum_dB = 10*log10(power_received_sum);


mean_timedelay=sum(power_received_ray.*time_delay);%
mean_timedelay_2pow=sum(power_received_ray.*time_delay.^2);%
tave=mean_timedelay/power_received_sum;%
et=mean_timedelay_2pow/power_received_sum ;%;
RMS=sqrt(et-tave^2);%求均方根时延


power_received_los = abs(E_los_abs).^2*wavelength^2/(8*pi*enta);
power_received_los_abs = abs(power_received_los);
k=power_received_los_abs/(power_received_sum - power_received_los);%K因子等于直达路径的功率比其余路径的总功率
K_dB=10*log10(k);%K因子
hmatrix=sum(E_received/E_tx);%传输矩阵的元素

pathloss_sum = power_tx./power_received_sum;%路径损耗 （正数）
pathloss_sum_dB=10*log10(power_tx./power_received_sum);%路径损耗

save(['indoor_Rv0.2_antenna',num2str(u),'.mat']);
end
toc;