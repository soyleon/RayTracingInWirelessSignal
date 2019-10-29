function pr=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT)
%多次反射射线的接收判决及场强计算
tr=[rx-t1,ry-t2,rz-t3];
dtr=sqrt((rx-t1)^2+(ry-t2)^2+(rz-t3)^2);
d1=dot(tr,newray);
if d1<=0
    pr=[];
else
    d=d1+sum(pathlength);%总传播路径
    dr=sqrt(dtr^2-d1^2);%接收点到射线的距离
    r=a*pi*d/(180*sqrt(3));
    if dr>r %采用固定的接收球半径
        pr=[];
    else
        refnumber=size(pathlength,2);  %返回pathlength的列数
        pr(1,1)=sqrt(GainT)*prod(rcoe)*l/(4*pi*d)*exp(-1j*2*pi*d/l);
        pr(1,2)=d*10/3;%时延？？？
        %pr(1,3)=180-acosd(d1/dtr);%到达角
        pr(1,3)=acosd(dot(newray,[0 0 1]));
        %pr(1,4)=refnumber;%反射次数

        pr(1,4) = newray(1,1);
        pr(1,5) = newray(1,2);
        pr(1,6) = newray(1,3);
        pr(1,7) = refnumber;
    end
end
end   
