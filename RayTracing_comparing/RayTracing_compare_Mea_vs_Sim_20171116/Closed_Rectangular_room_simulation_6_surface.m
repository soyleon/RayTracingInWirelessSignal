clear all
% 矩形室内仿真主程序：能够仿真得到路径损耗、均方根时延扩展、k因子以及功率时延谱
% 用于完全封闭的矩形室内仿真

%输入数据
h=5;w=23;length=20.5;%室内截面尺寸/中心报告厅的高度
pt=0.1;%发射功率,20dBm
f=5.6*10^9;%频率
c=3e8;
l=c/f;%波长
tx=1.44;
ty=8.5;
tz=11.46;
rx=2.92;ry=13;%接收点

t = 0;
x = 0.026;
for u=1:64
    rzmax = 9.431 + x*1*(u-1);
    t = t+1;    
    
%混凝土的相对介电常数
permitivity0=6.4;  %近轴截面
permitivity5=6.4;  %远轴截面
permitivity1=6.4;  %地面
permitivity2=6.4;  %顶面
permitivity3=6.4;  %左墙面
permitivity4=6.4;  %右墙面
%混凝土电导率
conductivity0=10^(-2);  %近轴截面
conductivity5=10^(-2);  %远轴截面
conductivity1=10^(-2);  %地面
conductivity2=10^(-2);  %顶面
conductivity3=10^(-2);  %左墙面
conductivity4=10^(-2);  %右墙面
rcollect=1.2;%接收球半径
% d=rzmax-tz;%设置的接收点距离间隔 
%输入结束
%有损耗介质的复相对介电常数计算公式
e0=permitivity0-1j*60*conductivity0*l;  %近轴截面
e5=permitivity5-1j*60*conductivity5*l;  %远轴截面
e1=permitivity1-1j*60*conductivity1*l;  %地面
e2=permitivity2-1j*60*conductivity2*l;  %顶面
e3=permitivity3-1j*60*conductivity3*l;  %左墙面
e4=permitivity4-1j*60*conductivity4*l;  %右墙面  
a=sqrt(3)*rcollect*180/(pi*rzmax);%发射射线的间隔角                   
a=min(a,1);
a=1;  %本次仿真角度设置为1°
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
% hwait=waitbar(0,'请等待>>>>>>>>');  %进度条设置
% number1=0;  %进度条设置
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
%参数设置
pt0=pt/number;
%定义6个面，前三个值表示各面的法向量
n1=[1 0 0 0];  %地面
n2=[-1 0 0 h];  %顶面
n3=[0 1 0 0];  %左墙面
n4=[0 -1 0 w];  %右墙面
n5=[0 0 1 0];  %近轴截面
n6=[0 0 -1 length];  %远轴截面  
%rn=(rzmax-tz)/d;   %接收点总数
% number2=number;  %进度条设置
% for q=1:rn
% rz(q)=tz+d*q; %接收点在隧道轴线上的位置
n0=1;
for n=1:an
    for m=1:bn(n) 
%         %进度条设置
%         number1=number1+1;
%         if number2-number1<=100
%             waitbar(number1/number2,hwait,'即将完成');
%         else
%             str=['正在运行中',num2str(100*number1/number2),'%'];
%             waitbar(number1/number2,hwait,str);
%         end  %进度条设置
        %确定直达径
        if vz(n,m)==0 %垂直于轴向的射线，直达径
            pr{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rzmax,a,l);  %接收射线功率
            if isempty(pr{n,m})==0
                pr0{t,n0}=pr{n,m};  %第q个接收点的第n0（q）个接收射线功率
                n0(1)=n0+1;
            else
                %接收点无法接收该射线
            end
            continue
        elseif vx(n,m)==0&&vy(n,m)==0 %平行于隧道轴向的射线，直达径
            pr{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rzmax,a,l);  %接收射线功率
            if isempty(pr{n,m})==0
                pr0{t,n0}=pr{n,m};  %第q个接收点的第n0（q）个接收射线功率
                n0=n0+1;
            else
                %接收点无法接收该射线
            end
            continue
        else
            surface1{n,m}=judge1(tx,ty,tz,h,w,vx(n,m),vy(n,m),vz(n,m));  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
            if surface1{n,m}==0  %与近轴截面相交
                point1{n,m}=intersectmianjuxing0(vx(n,m),vy(n,m),vz(n,m),w,h,n5,tx,ty,tz);
            elseif surface1{n,m}==1  %与地面相交
                point1{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),w,n1,tx,ty,tz,rzmax);
            elseif surface1{n,m}==2  %与顶面相交
                point1{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),w,n2,tx,ty,tz,rzmax);
            elseif surface1{n,m}==3  %与左墙面相交
                point1{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),h,n3,tx,ty,tz,rzmax);
            else  %与右墙面相交
                point1{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),h,n4,tx,ty,tz,rzmax);
            end
            rp=point1{n,m};
            if isempty(rp)==1  %与接收点之前的各面无交点
                pr{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rzmax,a,l);
                if isempty(pr{n,m})==0  %判断射线被接收点接收
                    pr0{t,n0}=pr{n,m};
                    n0=n0+1;
                    continue
                else  %判断射线不被接收点接收，继续跟踪
                    surface11{n,m}=judge2(tx,ty,tz,h,w,length,vx(n,m),vy(n,m),vz(n,m));  %考虑射线打到接收点之后的场景，判断射线与接收点之后的哪个面求交
                    if surface11{n,m}==5    %与远轴截面相交
                        point11{n,m}=intersectmianjuxing15(vx(n,m),vy(n,m),vz(n,m),w,h,length,n6,tx,ty,tz);
                    elseif surface11{n,m}==1  %与地面相交
                        point11{n,m}=intersectmianjuxing11(vx(n,m),vy(n,m),vz(n,m),w,length,n1,tx,ty,tz,rzmax); 
                    elseif surface11{n,m}==2  %与顶面相交
                        point11{n,m}=intersectmianjuxing11(vx(n,m),vy(n,m),vz(n,m),w,length,n2,tx,ty,tz,rzmax);
                    elseif surface11{n,m}==3  %与左墙面相交
                        point11{n,m}=intersectmianjuxing12(vx(n,m),vy(n,m),vz(n,m),h,length,n3,tx,ty,tz,rzmax);
                    else    %与右墙面相交
                        point11{n,m}=intersectmianjuxing12(vx(n,m),vy(n,m),vz(n,m),h,length,n4,tx,ty,tz,rzmax);
                    end
                    %原发射射线在接收点之后与各面求交后1次跟踪
                    rp=point11{n,m}; 
                    [newray,rcoe(1,1)]=reflectdirectionjx(rp,vx(n,m),vy(n,m),vz(n,m),n6,n1,n2,n3,n4,e5,e1,e2,e3,e4);  %求解反弹射线向量、反射系数
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                    pathlength(1,1)=rp(1,4);  %发射点与交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    surface12{n,m}=judge2(t1,t2,t3,h,w,length,v1,v2,v3);  %考虑射线打到接收点之后的场景，判断射线与接收点之后的哪个面求交
                    if surface12{n,m}==5  %与远轴截面相交
                        point12{n,m}=intersectmianjuxing15(v1,v2,v3,w,h,length,n6,t1,t2,t3);
                    elseif surface12{n,m}==1  %与地面相交
                        point12{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n1,t1,t2,t3,rzmax);
                    elseif surface12{n,m}==2  %与顶面相交
                        point12{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n2,t1,t2,t3,rzmax);
                    elseif surface12{n,m}==3  %与左墙面相交
                        point12{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n3,t1,t2,t3,rzmax);
                    else  %与右墙面相交
                        point12{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n4,t1,t2,t3,rzmax);
                    end
                    rp=point12{n,m};
                    if isempty(rp)==1  %与接收点之后的各面无交点
                        pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);
                        rcoe=[];pathlength=[];
                        if isempty(pr{n,m})==0
                            pr0{t,n0}=pr{n,m};
                            n0=n0+1;
                        else
                            %可以对射线继续追踪
                        end
                        rcoe=[];pathlength=[];
                        continue
                    else
                        %可以对射线继续追踪
                    end
                end
                rcoe=[];pathlength=[];
                continue
            else  %与接收点之前的各面有交点
                %原发射射线在接收点之前与各面求交后1次跟踪
                [newray,rcoe(1,1)]=reflectdirectionjx(rp,vx(n,m),vy(n,m),vz(n,m),n5,n1,n2,n3,n4,e0,e1,e2,e3,e4);  %求解反弹射线向量、反射系数
                t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %交点坐标
                pathlength(1,1)=rp(1,4);  %发射点与交点距离
                v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                surface2{n,m}=judge1(t1,t2,t3,h,w,v1,v2,v3);  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                if surface2{n,m}==0  %与近轴截面相交
                    point2{n,m}=intersectmianjuxing0(v1,v2,v3,w,h,n5,t1,t2,t3);
                elseif surface2{n,m}==1  %与地面相交
                    point2{n,m}=intersectmianjuxing1(v1,v2,v3,w,n1,t1,t2,t3,rzmax);
                elseif surface2{n,m}==2  %与顶面相交
                    point2{n,m}=intersectmianjuxing1(v1,v2,v3,w,n2,t1,t2,t3,rzmax);
                elseif surface2{n,m}==3  %与左墙面相交
                    point2{n,m}=intersectmianjuxing2(v1,v2,v3,h,n3,t1,t2,t3,rzmax);
                else  %与右墙面相交
                    point2{n,m}=intersectmianjuxing2(v1,v2,v3,h,n4,t1,t2,t3,rzmax);
                end
                rp=point2{n,m};
                if isempty(rp)==1  %与接收点之前的各面无交点
                    pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);  %求解反弹射线向量、反射系数
                    if isempty(pr{n,m})==0  %判断射线被接收点接收  
                        rcoe=[];pathlength=[];
                        pr0{t,n0}=pr{n,m};
                        n0=n0+1;
                        continue
                    else
                        surface21{n,m}=judge2(t1,t2,t3,h,w,length,v1,v2,v3);  %考虑射线打到接收点之后的场景，判断射线与接收点之后的各面求交
                        if surface21{n,m}==5  %与远轴截面相交
                            point21{n,m}=intersectmianjuxing15(v1,v2,v3,w,h,length,n6,t1,t2,t3);
                        elseif surface21{n,m}==1  %与地面相交
                            point21{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n1,t1,t2,t3,rzmax); 
                        elseif surface21{n,m}==2  %与顶面相交
                            point21{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n2,t1,t2,t3,rzmax);
                        elseif surface21{n,m}==3  %与左墙面相交
                            point21{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n3,t1,t2,t3,rzmax);
                        else  %与右墙面相交
                            point21{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n4,t1,t2,t3,rzmax);
                        end
                        %接收点之前1次反弹射线在接收点之后与各面求交后1次跟踪
                        rp=point21{n,m};
                        [newray,rcoe(1,2)]=reflectdirectionjx(rp,v1,v2,v3,n6,n1,n2,n3,n4,e5,e1,e2,e3,e4);  %求解反弹射线向量、反射系数
                        t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %新交点坐标
                        pathlength(1,2)=rp(1,4);  %1次反射点与新交点距离
                        v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                        surface22{n,m}=judge2(t1,t2,t3,h,w,length,v1,v2,v3);  %考虑射线打到接收点之后的场景，判断射线与接收点之后的各面求交
                        if surface22{n,m}==5  %与远轴截面相交
                            point22{n,m}=intersectmianjuxing15(v1,v2,v3,w,h,length,n6,t1,t2,t3);
                        elseif surface22{n,m}==1  %与地面相交
                            point22{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n1,t1,t2,t3,rzmax);
                        elseif surface22{n,m}==2  %与顶面相交
                            point22{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n2,t1,t2,t3,rzmax);
                        elseif surface22{n,m}==3  %与左墙面相交
                            point22{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n3,t1,t2,t3,rzmax);
                        else  %与右墙面相交
                            point22{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n4,t1,t2,t3,rzmax);
                        end
                        rp=point22{n,m};
                        if isempty(rp)==1  %与接收点之后的各面无交点
                            pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);
                            if isempty(pr{n,m})==0  %判断射线被接收点接收
                                rcoe=[];pathlength=[];
                                pr0{t,n0}=pr{n,m};
                                n0=n0+1;
                            else
                                %可以对射线继续追踪
                            end
                            rcoe=[];pathlength=[];
                            continue
                        else
                            %可以对射线继续追踪
                        end
                    end
                    rcoe=[];pathlength=[];
                    continue
                else  %与接收点之前的各面有交点
                    %接收点之前1次反弹射线在接收点之前与各面求交后2次跟踪
                    [newray,rcoe(1,2)]=reflectdirectionjx(rp,v1,v2,v3,n5,n1,n2,n3,n4,e0,e1,e2,e3,e4);  %求解反弹射线向量、反射系数 
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %新交点坐标
                    pathlength(1,2)=rp(1,4);  %1次反射点与新交点距离
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %反弹射线向量
                    surface3{n,m}=judge1(t1,t2,t3,h,w,v1,v2,v3);  %考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
                    if surface3{n,m}==0  %与近轴截面相交
                        point3{n,m}=intersectmianjuxing0(v1,v2,v3,w,h,n5,t1,t2,t3);
                    elseif surface3{n,m}==1  %与地面相交
                        point3{n,m}=intersectmianjuxing1(v1,v2,v3,w,n1,t1,t2,t3,rzmax);
                    elseif surface3{n,m}==2  %与顶面相交
                        point3{n,m}=intersectmianjuxing1(v1,v2,v3,w,n2,t1,t2,t3,rzmax);
                    elseif surface3{n,m}==3  %与左墙面相交
                        point3{n,m}=intersectmianjuxing2(v1,v2,v3,h,n3,t1,t2,t3,rzmax);
                    else  %与右墙面相交
                        point3{n,m}=intersectmianjuxing2(v1,v2,v3,h,n4,t1,t2,t3,rzmax);
                    end
                    rp=point3{n,m};
                    if isempty(rp)==1  %与接收点之前的各面无交点
                        pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);
                        if isempty(pr{n,m})==0  %判断射线被接收点接收
                            rcoe=[];pathlength=[];
                            pr0{t,n0}=pr{n,m};
                            n0=n0+1;
                        else
                            %可以对射线继续追踪
                        end
                    else
                        %可以对射线继续追踪
                    end
                end
            end
        end
        rcoe=[];pathlength=[];
    end
end

for m=1:n0-1
    pr1(t,:)=pr0{t,m};
    pr2(t,m)=pr1(t,1);
    td(t,m)=pr1(t,2);
    pr20(t,m)=abs(pr2(t,m));
    pr21(t,m)=pt0*2*pi/l.*pr20(t,m)^2;%每根射线的功率
    pl0(t,m)=10*log10(pt0/pr21(t,m));%每根射线路径损耗
    pr22(t,m)=10*log10(pr21(t,m))+30;%dBm  
end
   ptotal(t)=sum(pr20(t,:));
   pttotal(t)=sum(pr20(t,:).*td(t,:));
   pttotal2(t)=sum(pr20(t,:).*td(t,:).^2);
   tave(t)=pttotal(t)/ptotal(t);
   et(t)=pttotal2(t)/ptotal(t);
   rms(t)=sqrt(et(t)-tave(t)^2);
   los(t)=norm([rx-tx,ry-ty,rzmax-tz]);
   prlos(t,1)=l/(4*pi*los(t))*exp(-1j*2*pi*los(t)/l);
   pr3(t,1)=sum(pr2(t,:));
   k(t)=(abs(prlos(t,1)))^2/(abs(pr3(t,1)))^2;
   hmatrix(t,1)=sum(pr2(t,:));%传输矩阵的元素
%end
K(t)=10*log10(k(t));%K因子
pr4(t)=pt0*2*pi/l.*abs(pr3(t)).^2;%接收功率
pl(t)=10*log10(pt./pr4(t));%路径损耗

for m = 1:n0-1
    if td(t,m) == 0;
        pl(t,m) = NaN;
        td(t,m) = NaN;
    end
end
end

%trd=[tz+d:d:tz+d*rn];
disp(['K(dB）=' num2str(K)]);
disp(['rms=' num2str(rms)]);
stem(td(1,1:n0(1)-1),pl0(1,1:n0(1)-1))
grid on
xlabel('时延（ns）')
ylabel('路径损耗（dB）')



%  
% surf(1:5,1:5 ,1:5)
% else
%     figure(1)
%     plot(trd,K)
%     grid on
%     xlabel('收发距离（m）')
%     ylabel('K因子（dB）')
%     figure(2)
%     plot(trd,rms)
%      grid on
%     xlabel('收发距离（m）')
%     ylabel('均方根时延（ns）')
%      figure(3)
%     plot(trd,pl)
%      grid on
%     xlabel('收发距离（m）')
%     ylabel('路径损耗（dB）')
% end
