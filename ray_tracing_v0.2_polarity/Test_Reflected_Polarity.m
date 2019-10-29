
clear
frequency=5.6*10^9;%频率
c=3e8;
wavelength=c/frequency;%波长
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


e_face = [e_floor,e_ceiling,e_leftwall,e_rightwall,e_frontwall,e_behindwall,e_obwall,e_window];


theta = 180*rand(1,1);
phi = 360*rand(1,1);

vx = sind(theta)*cosd(phi);
vy = sind(theta)*sind(phi);
vz = cosd(theta);
n_floor_face = [0,0,1,0];
n_ceiling_face = [0,0,1,-3.1];
n_leftwall_face = [1,0,0,0];
n_rightwall_face = [1,0,0,-6.8];
n_frontwall_face = [0,1,0,0];
n_behindwall_face = [0,1,0,-6.5];


n_obwall_face = [1,0,0,-3];


n_face = [n_floor_face;n_ceiling_face;n_leftwall_face;n_rightwall_face;n_frontwall_face;n_behindwall_face;n_obwall_face];

ray_vector = [vx,vy,vz];
i = randi([1 7]);
nvector = n_face(i,1:3);e = e_face(i);

dir_ray = dot(ray_vector,nvector);
newray(1,1:3) = ray_vector-2*dir_ray*nvector;

vertical_in = cross(ray_vector,nvector);
R_parallel = (e*abs(dir_ray)-sqrt(e-1+dir_ray^2))/(e*abs(dir_ray)+sqrt(e-1+dir_ray^2));
R_vertical = (abs(dir_ray)-sqrt(e-1+dir_ray^2))/(abs(dir_ray)+sqrt(e-1+dir_ray^2));
if norm(vertical_in)~=0
    vertical_in = vertical_in/norm(vertical_in);
    vertical_in = vertical_in;
    parallel_in = cross(ray_vector,vertical_in);
    parallel_in = parallel_in/norm(parallel_in);
    parallel_in = parallel_in;
    vertical_ref = vertical_in;
    parallel_ref = cross(newray(1,1:3),vertical_in);
    parallel_ref = parallel_ref/norm(parallel_ref);
    
    %cos_eta = dot(parallel_in,ray_vector);
    %cos_eta = cos_eta/norm(cos_eta);
    %cos_gama = dot(vertical_in,ray_vector);
    %cos_gama = cos_gama/norm(cos_gama);
    
    
    %rcoe_para= parallel_in.*parallel_ref.*R_parallel;%平行极化反射系数
    rcoe_para= dot(parallel_in,parallel_ref).*R_parallel;%平行极化反射系数
    %rcoe_ver = vertical_in.*vertical_ref.*R_vertical;%垂直极化反射系数
    rcoe_ver = dot(vertical_in,vertical_ref).*R_vertical;%垂直极化反射系数
    rcoe = rcoe_para+rcoe_ver;
else
    rcoe = R_parallel;
end

%rcoe = sqrt(rcoe(1,1)^2+rcoe(1,2)^2+rcoe(1,3)^2);%有错误，不应该在这里求平方和，应该在最后求平方和