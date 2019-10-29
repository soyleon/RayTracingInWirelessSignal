lear
tic;
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

reflect_time = 4;
num_antenna =1;
num_ray_R = 1;

Tx1 = [3.65,1.0,2.1];
Rx1 = [3.65,4.38+0.03,2.1];
Tx = Tx1;
Rx = Rx1;
tx = Tx(:,1); %发送点
ty = Tx(:,2);
tz = Tx(:,3);
rx = Rx(:,1);  %接收点
ry= Rx(:,2);
rz = Rx(:,3);
plot3(tx,ty,tz,'r.','MarkerSize',20,'linewidth',2)
plot3(rx,ry,rz,'g.','MarkerSize',20,'linewidth',2)
plot3([tx,tx],[ty,ty],[0,tz],'k','linewidth',2)
plot3([tx,tx-0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',2)
plot3([tx,tx+0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',2)
plot3([rx,rx],[ry,ry],[0,rz],'k','linewidth',2)
plot3([rx,rx-0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',2)
plot3([rx,rx+0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',2)

delta_theta_temp = [2:0.5:10];
for i = 1:1
    num_ray_R = 1;
    delta_theta = delta_theta_temp(1,i);
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
    %progress bar init
    hwait=waitbar(0,'请等待>>>>>>>>');  %进度条设置
    number=0;  %进度条设置
    num_ray = sum(num_phi);
    
    for n = 1:num_theta
        for m = 1:num_phi(n)
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
            rp = cell(1,reflect_time);
            for ref_i = 1:reflect_time
                point{n,m}{1,ref_i} = face_intersected(v1,v2,v3,t1,t2,t3,n_face,p_allface);
                rp{1,ref_i} = point{n,m}{1,ref_i};
                if isnan(rp{1,ref_i}(1,4))
                    continue
                end
                if isempty(rp{1,ref_i}) == 1
                    continue
                end
                [newray] = reflected_map(rp{1,ref_i},v1,v2,v3,n_face);
                t1 = rp{1,ref_i}(1,1); t2 = rp{1,ref_i}(1,2); t3 = rp{1,ref_i}(1,3);
                pathlength(1,ref_i) = rp{1,ref_i}(1,4);
                v1 = newray(1,1); v2 = newray(1,2); v3 = newray(1,3);
                intersect_flag = intersection_judge(v1,v2,v3,t1,t2,t3,rx,ry,rz,n_face,p_allface);
                if intersect_flag == 1
                    parameterR{n,m}= receive_ang(t1,t2,t3,rx,ry,rz,newray,delta_theta,pathlength);
                    if isempty(parameterR{n,m}) == 0
                        pr_temp(i,num_ray_R) = parameterR{n,m};
                        num_ray_R = num_ray_R+1;
                        x_inter = zeros(1,ref_i);
                        y_inter = zeros(1,ref_i);
                        z_inter = zeros(1,ref_i);
                        for t = 1:ref_i
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
    end
    delete(hwait);
    time_t=toc;
    time(i) = time_t;
    receiver_radius = pr_temp-1;
    ray_num(i) = num_ray_R;
end