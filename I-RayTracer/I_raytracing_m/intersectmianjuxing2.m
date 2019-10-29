    function [point1]=intersectmianjuxing2(v1,v2,v3,h,n,tx,ty,tz,w)
%与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断交点是否在矩形室实际范围内

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz+n(1,4))/sign;
if v2*t0+ty>0&&v2*t0+ty<w&&v3*t0+tz>0&&v3*t0+tz<h
    if v1*t0+tx<0.001 %考虑到计算机误差
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,3]; %左墙面
    else
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,4]; %右墙面
    end
else
    point1=[];%反射点超出左右面范围
end
end


