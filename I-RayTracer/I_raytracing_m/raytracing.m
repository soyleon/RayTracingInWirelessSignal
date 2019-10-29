%%C# call matlab funtion, the funtion is the algorithm of SBR, it traverse
%%every ray in the environment, and it may not judge the correct face if
%%the environment is complicated. So it should be motified at the jduge
%%funcion,to make it can clarifiy the face which the ray can intersect


function [power_received_ray,power_received_ray_dB,power_received_sum,power_received_sum_dB,pathloss_ray,pathloss_ray_dB,pathloss_sum,pathloss_sum_dB,time_delay,RMS,K,K_dB,DOA,DOD] = raytracing(face,power_transmitter,frequency,face_permitivity,face_conductivity,transmitter_number,receiver_num,transmitter_location,receiver_location,antenna_gain)


Height=5;Width=23;Length=20.5;%室内截面尺寸，（单位为米:m）
WidthPlatform = 5;LengthPlatform = 20.5;HighPlatform = 1.5 ; %讲台尺寸,（单位为米:m）
pt=power_transmitter;%发射功率,10mw,对应10dbm（输入单位为mw）
f=frequency;%频率
c=3e8;
l=c/f;%波长

%% 有损耗介质的复相对介电常数计算公式
%混凝土的相对介电常数
permitivity0=face_permitivity;  %近轴截面
permitivity5=face_permitivity;  %远轴截面
permitivity1=face_permitivity;  %地面
permitivity2=face_permitivity;  %顶面
permitivity3=face_permitivity;  %左墙面
permitivity4=face_permitivity;  %右墙面
%混凝土电导率
conductivity0=face_conductivity;  %近轴截面
conductivity5=face_conductivity;  %远轴截面
conductivity1=face_conductivity;  %地面
conductivity2=face_conductivity;  %顶面
conductivity3=face_conductivity;  %左墙面
conductivity4=face_conductivity;  %右墙面

e0=permitivity0-1j*60*conductivity0*l;  %近轴截面
e5=permitivity5-1j*60*conductivity5*l;  %远轴截面
e1=permitivity1-1j*60*conductivity1*l;  %地面
e2=permitivity2-1j*60*conductivity2*l;  %顶面
e3=permitivity3-1j*60*conductivity3*l;  %左墙面
e4=permitivity4-1j*60*conductivity4*l;  %右墙面




%% 天线
TransmitterNum = transmitter_number;
ReceiverNum = receiver_num;
%输入结束
%% 进度条设置
hwait=waitbar(0,'请等待>>>>>>>>');  %进度条设置
number1=0;  %进度条设置
%rcollect = 1.2; %初始接收球半径设置
%%

for u=1:TransmitterNum % 增加：u表示发射天线个数
    for p=1:ReceiverNum %增加：p表示接收天线个数
        tx = transmitter_location(u,1);
        ty = transmitter_location(u,2);
        tz = transmitter_location(u,3);
        rx = receiver_location(p,1);
        ry = receiver_location(p,2);
        rz = receiver_location(p,3);
        
        %% 画场景图
figure(1)
hold on
w = Width;
length = Length;
h = Height;
x=[0 length length 0 0];
y=[0 0 0 0 0];
z=[0 0 h h 0];
plot3(x,y,z,'k','linewidth',3)
hold on
x=[0 0 0 0];
y=[0 w w 0];
z=[0 0 h h];
plot3(x,y,z,'k','linewidth',3)
x=[0 length length];
y=[w w 0];
z=[h h h];
plot3(x,y,z,'k','linewidth',3)
x=[0 length length];
y=[w w 0];
z=[0 0 0];
plot3(x,y,z,'k--')
x=[length length];
y=[w w];
z=[0 h];
plot3(x,y,z,'k--')
plot3(x,y,z,'k--')
plot3(tx,ty,tz,'r.','MarkerSize',20)
plot3(rx,ry,rz,'g.','MarkerSize',20)
plot3([tx,tx],[ty,ty],[0,tz],'k','linewidth',3)
plot3([tx,tx-0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',3)
plot3([tx,tx+0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',3)
plot3([rx,rx],[ry,ry],[0,rz],'k','linewidth',3)
plot3([rx,rx-0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',3)
plot3([rx,rx+0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',3)
x=[0,0,0];
y=[0,WidthPlatform,WidthPlatform];
z=[HighPlatform,HighPlatform,0];
plot3(x,y,z,'k--');
x=[LengthPlatform,LengthPlatform,LengthPlatform];
y=[0,WidthPlatform,WidthPlatform];
z=[HighPlatform,HighPlatform,0];
plot3(x,y,z,'k--');
x=[0,LengthPlatform];
y=[WidthPlatform,WidthPlatform];
z=[HighPlatform,HighPlatform];
plot3(x,y,z,'k--');
hold on;                
x = [0,0,0,0];
y = [0,0,WidthPlatform,WidthPlatform];
z = [0,HighPlatform,HighPlatform,0];
fill3(x,y,z,'g');
x = [0,0,LengthPlatform,LengthPlatform];
y = [0,WidthPlatform,WidthPlatform,0];
z = [HighPlatform,HighPlatform,HighPlatform,HighPlatform];
fill3(x,y,z,'g');
x = [0,0,LengthPlatform,LengthPlatform];
y = [WidthPlatform,WidthPlatform,WidthPlatform,WidthPlatform];
z= [0,HighPlatform,HighPlatform,0];
fill3(x,y,z,'g');    
        
        %% 参数设置  （1）如何确定发射射线的角度间隔，在经度上的非均匀角度发射？ （2）如何保证高效率以及高有效率的发射射线间隔？
        
%        a=sqrt(3)*rcollect*180/(pi*rx);%发射射线的间隔角
%        a=min(a,1);
        a=10;  %refer the manul of Wireless Insite
        an=floor(180/a);
        
        for n=1:an-1 %可以理解为射线的纬度
            a1(n)=a*n;
            b(n)=a/sind(a1(n));  %相邻射线在经度方向的间隔
            bn(n)=floor(360/b(n));  %各纬度上发射射线条数
        end
        a1(an)=a*an;
        if a1(an)==180
            b(an)=1;
            bn(an)=1;
        else
            b(an)=a/sind(a1(an));
            bn(an)=floor(360/b(an));    
        end
        
        for n=1:an
            for m=1:bn(n)
                b1(n,m)=m*b(n);
                vx(n,m)=sind(a1(n))*cosd(b1(n,m));
                vy(n,m)=sind(a1(n))*sind(b1(n,m));
                vz(n,m)=cosd(a1(n));  %射线的方向向量
            end
        end
        bn(1)=bn(1)+1;
        vx(1,bn(1))=0;
        vy(1,bn(1))=0;
        vz(1,bn(1))=1;  %遗漏的射线，即沿轴线方向的射线
        number=sum(bn);  %发射射线总数
        
        pt0=pt/number;
        
        %% 定义6个面，前三个值表示各面的法向量,最后一个值表示位置
        
        
        
        nFloor=[0 0 1 0];  %地面1
        nCeiling=[0 0 -1 Height];  %顶面2
        nLeftWall=[1 0 0 0];  %左墙面3
        nRightWall=[-1 0 0 Length];  %右墙面4
        nFrontWall=[0 1 0 0];  %近轴截面0
        nBehindWall=[0 -1 0 Width];  %远轴截面5
        nPlatformFrontWall = [0 1 0 WidthPlatform];%讲台前面
        nPlatformUpWall = [0 0 1 HighPlatform];%讲台上面

%         nFloor=face(1,:);  %地面1
%         nCeiling=face(2,:);  %顶面2
%         nLeftWall=face(3,:);  %左墙面3
%         nRightWall=face(4,:);  %右墙面4
%         nFrontWall=face(5,:);  %近轴截面0
%         nBehindWall=face(6,:);  %远轴截面5
%         nPlatformFrontWall = face(7,:);%讲台前面
%         nPlatformUpWall = face(8,:);%讲台上面
        
        rymax=Width;
        d=rymax-ry;%设置的接收点距离间隔
        rn=(rymax-ry)/d;   %接收点总数
        
        number2=number*TransmitterNum*ReceiverNum;  %进度条设置
        
        %% 跟踪过程
        for q=1:rn %发送端到接收端各个点的跟踪
            ry(q)=ry+d*(q-1); %接收点在x轴上的位置
            n0(q)=1;
            for n=1:an
                if a1(n)>=0&&a1(n)<10
                    gt(n)=-25.0;
                elseif a1(n)<20
                    gt(n)=-12.5;
                elseif a1(n)<30
                    gt(n)=-5.76;
                elseif a1(n)<40
                    gt(n)=-3.55;
                elseif a1(n)<50
                    gt(n)=-1.86;
                elseif a1(n)<60
                    gt(n)=-0.05;
                elseif a1(n)<70
                    gt(n)=0.86;
                elseif a1(n)<80
                    gt(n)=1.61;
                elseif a1(n)<90
                    gt(n)=2;
                elseif a1(n)<100
                    gt(n)=1.56;
                elseif a1(n)<110
                    gt(n)=1;
                elseif a1(n)<120
                    gt(n)=-0.38;
                elseif a1(n)<150
                    gt(n)=-3.84;
                elseif a1(n)<160
                    gt(n)=-8.28;
                elseif a1(n)<170
                    gt(n)=-12;
                else gt(n)=-25;
                end
                GainT = 10^(gt(n)/10);
                for m=1:bn(n)
                    %进度条设置
                    number1=number1+1;
                    if number2-number1<=100
                        h = waitbar(number1/number2,hwait,'即将完成');
                        
                    else
                        str=['正在运行中',num2str(100*number1/number2),'%'];
                        h = waitbar(number1/number2,hwait,str);
                    end  %进度条设置
                    %close(h);
                    %gt0=gt(n);
                    %确定直达径
                    %                   if vx(n,m)==(rx-tx)&&vy(n,m)==(ry-ty)&&vz(n,m)==(rz-tz) %直达径
                    pathlength = []; rcoe = [];
                    
                    
                    pr{u,p}{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rz,a,l,GainT);  %接收射线功率
                    if isempty(pr{u,p}{n,m})==0
                        pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %第q个接收点的第n0（q）个接收射线功率
                        n0(q)=n0(q)+1;
                        plot3([tx,rx],[ty,ry],[tz,rz])
                        d_ray_departure = sqrt((rx-tx)^2+(ry-ty)^2+(rz-tz)^2);                        
                        DOD{u,p}{q,n0(q)-1} = [(rx-tx)/d_ray_departure,(ry-ty)/d_ray_departure,(rz-tz)/d_ray_departure];
                        continue;
                    end
                    %                   else
                    surface1{u,p}{n,m}=judge1(tx,ty,tz,Height,Width,Length,HighPlatform,WidthPlatform,vx(n,m),vy(n,m),vz(n,m));  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                    if surface1{u,p}{n,m}==0  %与近轴截面相交
                        point1{u,p}{n,m}=intersectmianjuxing0(vx(n,m),vy(n,m),vz(n,m),Height,Length,nFrontWall,tx,ty,tz);
                    elseif surface1{u,p}{n,m} == 5
                        point1{u,p}{n,m}=intersectmianjuxing0(vx(n,m),vy(n,m),vz(n,m),Height,Length,nBehindWall,tx,ty,tz);
                    elseif surface1{u,p}{n,m}==1  %与地面相交
                        point1{u,p}{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),Width,nFloor,tx,ty,tz,Length);
                    elseif surface1{u,p}{n,m}==2  %与顶面相交
                        point1{u,p}{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),Width,nCeiling,tx,ty,tz,Length);
                    elseif surface1{u,p}{n,m}==3  %与左墙面相交
                        point1{u,p}{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),Height,nLeftWall,tx,ty,tz,Width);
                    elseif surface1{u,p}{n,m}==4  %与右墙面相交
                        point1{u,p}{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),Height,nRightWall,tx,ty,tz,Width);
                    elseif surface1{u,p}{n,m}==6  %与讲台上面相交
                        point1{u,p}{n,m}=intersectmianjuxing4(vx(n,m),vy(n,m),vz(n,m),WidthPlatform,HighPlatform,nPlatformUpWall,tx,ty,tz,Length);
                    else   %与讲台前面相交
                        point1{u,p}{n,m}=intersectmianjuxing3(vx(n,m),vy(n,m),vz(n,m),HighPlatform,WidthPlatform,Length,nPlatformFrontWall,tx,ty,tz);
                    end
                    rp=point1{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,1)]=reflectdirectionjx(rp,vx(n,m),vy(n,m),vz(n,m),nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %求解反弹射线向量、反射系数
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                    pathlength(1,1)=rp(1,4);  %发射点与交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    if isempty(pr{u,p}{n,m})==1  %与接收点之前的各面无交点
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %第q个接收点的第n0（q）个接收射线功率
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            plot3([tx,rp1(1,1),rx],[ty,rp1(1,2),ry],[tz,rp1(1,3),rz])
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %接收点无法接收该射线
                        end
                    end
                    
                    
                    
                    surface2{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                    if surface2{u,p}{n,m}==0  %与近轴截面相交
                        point2{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface2{u,p}{n,m} == 5
                        point2{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface2{u,p}{n,m}==1  %与地面相交
                        point2{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface2{u,p}{n,m}==2  %与顶面相交
                        point2{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface2{u,p}{n,m}==3  %与左墙面相交
                        point2{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface2{u,p}{n,m}==4  %与右墙面相交
                        point2{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface2{u,p}{n,m}==6  %与讲台上面相交
                        point2{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %与讲台前面相交
                        point2{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point2{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,2)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %求解反弹射线向量、反射系数
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                    pathlength(1,2)=rp(1,4);  %发射点与交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    if isempty(pr{u,p}{n,m})==1  %与接收点之前的各面无交点
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %第q个接收点的第n0（q）个接收射线功率
                            n0(q)=n0(q)+1;
                           	rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rx],[ty,rp1(1,2),rp2(1,2),ry],[tz,rp1(1,3),rp2(1,3),rz]);
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %接收点无法接收该射线
                        end
                    end
                    
                    
                    
                    surface3{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                    if surface3{u,p}{n,m}==0  %与近轴截面相交
                        point3{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface3{u,p}{n,m} == 5
                        point3{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface3{u,p}{n,m}==1  %与地面相交
                        point3{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface3{u,p}{n,m}==2  %与顶面相交
                        point3{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface3{u,p}{n,m}==3  %与左墙面相交
                        point3{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface3{u,p}{n,m}==4  %与右墙面相交
                        point3{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface3{u,p}{n,m}==6  %与讲台上面相交
                        point3{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %与讲台前面相交
                        point3{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point3{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,3)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %求解反弹射线向量、反射系数
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                    pathlength(1,3)=rp(1,4);  %发射点与交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    if isempty(pr{u,p}{n,m})==1  %与接收点之前的各面无交点
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %第q个接收点的第n0（q）个接收射线功率
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            rp3=point3{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rp3(1,1),rx],[ty,rp1(1,2),rp2(1,2),rp3(1,2),ry],[tz,rp1(1,3),rp2(1,3),rp3(1,3),rz]); 
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue
                        else
                            %接收点无法接收该射线
                        end
                    end
                    
                    
                    
                    surface4{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                    if surface4{u,p}{n,m}==0  %与近轴截面相交
                        point4{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface4{u,p}{n,m} == 5
                        point4{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface4{u,p}{n,m}==1  %与地面相交
                        point4{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface4{u,p}{n,m}==2  %与顶面相交
                        point4{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface4{u,p}{n,m}==3  %与左墙面相交
                        point4{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface4{u,p}{n,m}==4  %与右墙面相交
                        point4{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface4{u,p}{n,m}==6  %与讲台上面相交
                        point4{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %与讲台前面相交
                        point4{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point4{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,4)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %求解反弹射线向量、反射系数
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                    pathlength(1,4)=rp(1,4);  %发射点与交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    if isempty(pr{u,p}{n,m})==1  %与接收点之前的各面无交点
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %第q个接收点的第n0（q）个接收射线功率
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            rp3=point3{u,p}{n,m};
                            rp4=point4{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rp3(1,1),rp4(1,1),rx],[ty,rp1(1,2),rp2(1,2),rp3(1,2),rp4(1,2),ry],[tz,rp1(1,3),rp2(1,3),rp3(1,3),rp4(1,3),rz]);
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %接收点无法接收该射线
                        end
                    end
                    
                    
                    
                    
                    surface5{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                    if surface5{u,p}{n,m}==0  %与近轴截面相交
                        point5{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface5{u,p}{n,m}==5 %与远轴截面相交
                        point5{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface5{u,p}{n,m}==1  %与地面相交
                        point5{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface5{u,p}{n,m}==2  %与顶面相交
                        point5{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface5{u,p}{n,m}==3  %与左墙面相交
                        point5{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface5{u,p}{n,m}==4  %与右墙面相交
                        point5{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface5{u,p}{n,m}==6  %与讲台上面相交
                        point5{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %与讲台前面相交
                        point5{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point5{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,5)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %求解反弹射线向量、反射系数
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                    pathlength(1,5)=rp(1,4);  %发射点与交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    if isempty(pr{u,p}{n,m})==1  %与接收点之前的各面无交点
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %第q个接收点的第n0（q）个接收射线功率
                            pathlength = []; rcoe = [];
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            rp3=point3{u,p}{n,m};
                            rp4=point4{u,p}{n,m};
                            rp5=point5{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rp3(1,1),rp4(1,1),rp5(1,1),rx],[ty,rp1(1,2),rp2(1,2),rp3(1,2),rp4(1,2),rp5(1,2),ry],[tz,rp1(1,3),rp2(1,3),rp3(1,3),rp4(1,3),rp5(1,3),rz]);
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %接收点无法接收该射线
                        end
                    end
                end
            end
        end
        
        
        %% 输出结果计算
        for q=1:rn
            n1(q)=1;n2(q)=1;
            for m=1:n0(q)-1;
                path_received_temp=pr0{u,p}{q,m};
                aoatheta=path_received_temp(1,3);
                if aoatheta>=0&&aoatheta<10
                    gr=-25.0;
                elseif aoatheta<20
                    gr=-12.5;
                elseif aoatheta<30
                    gr=-5.76;
                elseif aoatheta<40
                    gr=-3.55;
                elseif aoatheta<50
                    gr=-1.86;
                elseif aoatheta<60
                    gr=-0.05;
                elseif aoatheta<70
                    gr=0.86;
                elseif aoatheta<80
                    gr=1.61;
                elseif aoatheta<90
                    gr=2;
                elseif aoatheta<100
                    gr=1.56;
                elseif aoatheta<110
                    gr=1;
                elseif aoatheta<120
                    gr=-0.38;
                elseif aoatheta<150
                    gr=-3.84;
                elseif aoatheta<160
                    gr=-8.28;
                elseif aoatheta<170
                    gr=-12;
                else gr=-25;
                end    %接收天线增益可以自行设置
                GainthetaR = 10^(gr/10);
            end
            for m=1:n0(q)-1
                path_received_temp = pr0{u,p}{q,m};%缓存上面得到的pr0的值，pr0中，u是指哪一根发射天线,p指的是哪一根接收天线,q是从发射点到接收点之间每隔一定距离点的数目，仿真点到点，所以q为1，m是指接收到的天线个数,pr内部的参数见receive1中的参数；
                E_loss{u,p}(q,m) = path_received_temp(1,1);%E_loss是指没有乘以发射(信号)功率的，在各个路径上损耗的场强（即信号）的参数；（复数）
                E_received{u,p}(q,m) = sqrt(GainthetaR)*sqrt(pt0)*E_loss{u,p}(q,m);%E_received：单根射线接收的电场；（复数）
                time_delay{u,p}(q,m) = path_received_temp(1,2);%time_delay：射线的到达时延
                E_loss_abs{u,p}(q,m) = abs(E_loss{u,p}(q,m));%E_loss_abs:上面电场的大小
                %pr21{u,p}(q,m)=GainthetaR*pt0*2*pi/l.*E_loss_abs{u,p}(q,m)^2;%每根射线的功率   需要乘天线发射增益与接收增益，db要换成倍数
                power_received_ray{u,p}(q,m) = GainthetaR*pt0.*E_loss_abs{u,p}(q,m)^2;%每根天线的接收功率（Wireless Insite和无线通信书上的由不同，目前按书上的来）
                power_received_ray_dB{u,p}(q,m)=10*log10(power_received_ray{u,p}(q,m));%每根天线的接收功率，单位dbm
                pathloss_ray{u,p}(q,m) = pt0/power_received_ray{u,p}(q,m);%每根射线的路径损耗
                pathloss_ray_dB{u,p}(q,m)=10*log10(pathloss_ray{u,p}(q,m));%每根射线路径损耗
                
                DOA{u,p}{q,m} = [path_received_temp(1,4),path_received_temp(1,5),path_received_temp(1,6)];
            end
            E_loss_sum{u,p} = sum(E_loss{u,p}(q,:));%总共的场强损耗，
            E_sum{u,p} = sum(E_received{u,p}(q,:));%总场强
            E_sum_timedelay{u,p}=sum(E_received{u,p}(q,:).*time_delay{u,p}(q,:));%
            E_sum_timedelay_pow{u,p}=sum(E_received{u,p}(q,:).*time_delay{u,p}(q,:).^2);%
            tave{u,p}=E_sum_timedelay{u,p}/E_sum{u,p};%
            et{u,p}=E_sum_timedelay_pow{u,p}/E_sum{u,p} ;%;
            RMS{u,p}(1,q)=sqrt(et{u,p}-tave{u,p}^2);%求均方根时延
            los_path=norm([rx-tx,ry-ty,rz-tz]);
            E_loss_los{u,p}(1,q) = l/(4*pi*los_path)*exp(-1j*2*pi*los_path/l);%直达径场强损耗
            E_los{u,p}(1,q) = sqrt(pt0)*sqrt(GainthetaR)*E_loss_los{u,p}(1,q);%直达径
            power_received_sum{u,p}(1,q)=sum(E_received{u,p}(q,:))^2;%总接收功率
            power_received_sum_dB{u,p}(1,q) = 10*log10(power_received_sum{u,p});
            k{u,p}(q)=(abs(E_los{u,p}(1,q)))^2/(abs(power_received_sum{u,p}(1,q)))^2;
            hmatrix{u,p}(1,q)=sum(E_loss{u,p}(q,:));%传输矩阵的元素
        end


K_dB{u,p}=10*log10(k{u,p});%K因子
pathloss_sum{u,p} = pt./power_received_sum{u,p};%路径损耗
pathloss_sum_dB{u,p}=10*log10(pt./power_received_sum{u,p});%路径损耗
    end
end
close(h);

time_delay;
RMS ;
power_received_ray;
power_received_ray_dB ;
power_received_sum ;
power_received_sum_dB ;
pathloss_ray;
pathloss_ray_dB ;
pathloss_sum;
pathloss_sum_dB;
h_matrix = hmatrix;
K = k;
K_dB = K;
DOA;
DOD;
%%
figure(2)
t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
plot3(x,y,z,'Color',[0.01,0.8,0.8]);
axis equal;
title('DOA');
hold on;
num_ray = size(DOA{1,1});

for i = 1:num_ray(1,2)
    angel_arrived_x(i) = DOA{1,1}{1,i}(1,1);
    angel_arrived_y(i)= DOA{1,1}{1,i}(1,2);
    angel_arrived_z(i) = DOA{1,1}{1,i}(1,3);
    plot3([-angel_arrived_x(i),0],[-angel_arrived_y(i),0],[-angel_arrived_z(i),0]);
end

saveas(2,'DOA.jpg')
close(figure(2));

%%
figure(3)
t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
plot3(x,y,z,'Color',[0.01,0.8,0.8]);
axis equal;
title('DOD');
hold on;
num_ray = size(DOD{1,1});
for i = 1:num_ray(1,2)
    angel_departure_x(i) = DOD{1,1}{1,i}(1,1);
    angel_departure_y(i)= DOD{1,1}{1,i}(1,2);
    angel_departure_z(i) = DOD{1,1}{1,i}(1,3);
    plot3([0,angel_departure_x(i)],[0,angel_departure_y(i)],[0,angel_departure_z(i)]);
end
saveas(3,'DOD.jpg')
close(figure(3));

%%
figure(4)

stem(time_delay{1,1}(1,1:n0(1)-1),pathloss_ray_dB{1,1}(1,1:n0(1)-1))
grid on
xlabel('Time Delay（ns）')
ylabel('Path loss（dB）')
title('Power Delay Profile')
saveas(4,'time_pl.jpg')
close(figure(4));
end


