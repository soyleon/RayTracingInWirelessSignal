function [point1]=intersectmianjuxing1(v1,v2,v3,w,n,tx,ty,tz,length)
%与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断交点是否在矩形室实际范围内

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz+n(1,4))/sign;  %括号中为发射点到底面距离，sign为法线与发射射线角度的余弦值
   if v1*t0+tx>0&&v1*t0+tx<length&&v2*t0+ty>0&&v2*t0+ty<w
      if v3*t0+tz<0.001
         point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,1];  %t0为发射点到交点的长度，1表示交点在底面上
      else
         point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,2];  %t0为发射点到交点的长度，2表示交点在顶面上
      end
      else 
       point1 = [];
   end
end

    