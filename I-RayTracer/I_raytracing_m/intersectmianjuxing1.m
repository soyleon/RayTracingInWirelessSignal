function [point1]=intersectmianjuxing1(v1,v2,v3,w,n,tx,ty,tz,length)
%���վ����������������󽻵ĺ��������о�����������������ཻ���������Ӧ���󽻣����жϽ����Ƿ��ھ�����ʵ�ʷ�Χ��

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz+n(1,4))/sign;  %������Ϊ����㵽������룬signΪ�����뷢�����߽Ƕȵ�����ֵ
   if v1*t0+tx>0&&v1*t0+tx<length&&v2*t0+ty>0&&v2*t0+ty<w
      if v3*t0+tz<0.001
         point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,1];  %t0Ϊ����㵽����ĳ��ȣ�1��ʾ�����ڵ�����
      else
         point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,2];  %t0Ϊ����㵽����ĳ��ȣ�2��ʾ�����ڶ�����
      end
      else 
       point1 = [];
   end
end

    