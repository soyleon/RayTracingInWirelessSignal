function [point1]=intersectmianjuxing0(v1,v2,v3,h,l,n,tx,ty,tz)
%���������󽻵ĺ��������о���������������ཻ���������Ӧ���󽻣����жϽ����Ƿ��ڽ������ʵ�ʷ�Χ��

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
   t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz+n(1,4))/sign;  %������Ϊ����㵽������ľ��룬signΪ�����뷢�����߽Ƕȵ�����ֵ
   if v1*t0+tx>0&&v1*t0+tx<l&&v3*t0+tz>0&&v3*t0+tz<h
      if v2*t0+ty<0.001
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,0];%t0Ϊ����㵽����ĳ��ȣ�0��ʾ�����ڽ������ǽ����
      else
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,5];%t0Ϊ����㵽����ĳ��ȣ�5��ʾ������Զ�����ǽ����
      end
   else 
       point1 = [];
   end
end

    