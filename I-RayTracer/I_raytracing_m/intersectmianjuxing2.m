    function [point1]=intersectmianjuxing2(v1,v2,v3,h,n,tx,ty,tz,w)
%�������������ǽ���󽻵ĺ��������о�����������������ཻ���������Ӧ���󽻣����жϽ����Ƿ��ھ�����ʵ�ʷ�Χ��

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz+n(1,4))/sign;
if v2*t0+ty>0&&v2*t0+ty<w&&v3*t0+tz>0&&v3*t0+tz<h
    if v1*t0+tx<0.001 %���ǵ���������
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,3]; %��ǽ��
    else
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,4]; %��ǽ��
    end
else
    point1=[];%����㳬�������淶Χ
end
end


