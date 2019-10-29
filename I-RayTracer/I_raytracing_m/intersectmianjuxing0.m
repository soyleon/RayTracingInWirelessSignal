function [point1]=intersectmianjuxing0(v1,v2,v3,h,l,n,tx,ty,tz)
%与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否在近轴截面实际范围内

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
   t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz+n(1,4))/sign;  %括号中为发射点到近轴面的距离，sign为法线与发射射线角度的余弦值
   if v1*t0+tx>0&&v1*t0+tx<l&&v3*t0+tz>0&&v3*t0+tz<h
      if v2*t0+ty<0.001
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,0];%t0为发射点到交点的长度，0表示交点在近轴截面墙面上
      else
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,5];%t0为发射点到交点的长度，5表示交点在远轴截面墙面上
      end
   else 
       point1 = [];
   end
end

    