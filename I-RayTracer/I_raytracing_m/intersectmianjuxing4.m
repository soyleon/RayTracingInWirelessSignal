function [point1]=intersectmianjuxing4(v1,v2,v3,wp,hp,n,tx,ty,tz,length)
%�뽲̨�Ϸ����ĺ��������о�����������������ཻ���������Ӧ����

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz-n(1,4))/sign;  %������Ϊ����㵽������룬signΪ�����뷢�����߽Ƕȵ�����ֵ
   if v1*t0+tx>0&&v1*t0+tx<length&&v2*t0+ty>0&&v2*t0+ty<wp
      if v3*t0+tz<hp+0.0001
         point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,6];  %t0Ϊ����㵽����ĳ��ȣ�6��ʾ�����ڽ�̨������
      else 
       point1 = [];
      end
   else
       point1 = [];
   end
end