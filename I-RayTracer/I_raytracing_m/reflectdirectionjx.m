function [newray,rcoe]=reflectdirectionjx(rp,v1,v2,v3,n0,n1,n2,n3,n4,n5,e0,e1,e2,e3,e4,e5)
%确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系数

linevector=[v1 v2 v3];
if rp(1,5)==0
    nvector=n0(1,1:3);e=e0;
elseif rp(1,5)==1
    nvector=n1(1,1:3);e=e1;
elseif rp(1,5)==2
    nvector=n2(1,1:3);e=e2;
elseif rp(1,5)==3
    nvector=n3(1,1:3);e=e3;
elseif rp(1,5)==4
    nvector=n4(1,1:3);e=e4;
else
    nvector=n5(1,1:3);e=e5;
end
d1=-dot(linevector,nvector);%入射角的余弦值
newray(1,1:3)= linevector+2*d1*nvector;%底面反射点反射方向的确定
if (rp(1,5)==1)||(rp(1,5)==2||rp(1,5)==6)
    rcoe=(e*d1-sqrt(e-1+d1^2))/(e*d1+sqrt(e-1+d1^2));%平行极化反射系数
else
    rcoe=(d1-sqrt(e-1+d1^2))/(d1+sqrt(e-1+d1^2));%垂直极化反射系数
end
%     rcoeparallel = (e*d1-sqrt(e-1+d1^2))/(e*d1+sqrt(e-1+d1^2));%平行极化反射系数
%     rcoeperpendicular = (d1-sqrt(e-1+d1^2))/(d1+sqrt(e-1+d1^2));%垂直极化反射系数
%     eiperpendicular = cross(linevector,nvector)./normest(cross(linevector,nvector));
%     eiparallel = cross(linevector,eiperpendicular)./normest(cross(linevector,eiperpendicular));
%     erparallel = cross(newray,eiperpendicular)./normest(cross(newray,eiperpendicular));
%     rcoe = rcoeparallel*dot(eiparallel,erparallel)+rcoeperpendicular*dot(eiperpendicular,eiperpendicular);
end



