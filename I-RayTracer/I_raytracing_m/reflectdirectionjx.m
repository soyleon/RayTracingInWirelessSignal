function [newray,rcoe]=reflectdirectionjx(rp,v1,v2,v3,n0,n1,n2,n3,n4,n5,e0,e1,e2,e3,e4,e5)
%ȷ�������������߷��䷽��ĺ������ɽ���λ��ȷ�����ߵķ��䷽�򣬲���¼�����ķ���ϵ��

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
d1=-dot(linevector,nvector);%����ǵ�����ֵ
newray(1,1:3)= linevector+2*d1*nvector;%���淴��㷴�䷽���ȷ��
if (rp(1,5)==1)||(rp(1,5)==2||rp(1,5)==6)
    rcoe=(e*d1-sqrt(e-1+d1^2))/(e*d1+sqrt(e-1+d1^2));%ƽ�м�������ϵ��
else
    rcoe=(d1-sqrt(e-1+d1^2))/(d1+sqrt(e-1+d1^2));%��ֱ��������ϵ��
end
%     rcoeparallel = (e*d1-sqrt(e-1+d1^2))/(e*d1+sqrt(e-1+d1^2));%ƽ�м�������ϵ��
%     rcoeperpendicular = (d1-sqrt(e-1+d1^2))/(d1+sqrt(e-1+d1^2));%��ֱ��������ϵ��
%     eiperpendicular = cross(linevector,nvector)./normest(cross(linevector,nvector));
%     eiparallel = cross(linevector,eiperpendicular)./normest(cross(linevector,eiperpendicular));
%     erparallel = cross(newray,eiperpendicular)./normest(cross(newray,eiperpendicular));
%     rcoe = rcoeparallel*dot(eiparallel,erparallel)+rcoeperpendicular*dot(eiperpendicular,eiperpendicular);
end



