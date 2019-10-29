function par=receive_ang(t1,t2,t3,rx,ry,rz,newray,delta_theta,pathlength)
tr=[rx-t1,ry-t2,rz-t3];
dtr=sqrt((rx-t1)^2+(ry-t2)^2+(rz-t3)^2);
d1=dot(tr,newray);
if d1<=0
    par=[];
else
    d=d1+sum(pathlength);%总传播路径
    dr=sqrt(dtr^2-d1^2);%接收点到射线的距离
    r=delta_theta*pi*d/(180*sqrt(3));
    if dr>r %采用固定的接收球半径
        par=[];
    else
        refnumber=size(pathlength,2);  %返回pathlength的列数
        par = r;%接收球半径
    end
end