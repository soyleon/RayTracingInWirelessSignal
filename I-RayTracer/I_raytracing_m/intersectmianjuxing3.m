function [point1]=intersectmianjuxing3(v1,v2,v3,hp,wp,l,n,tx,ty,tz)
%�뽲̨ǰ�����󽻵ĺ��������о�������뽲̨ǰ���ཻ���������Ӧ���󽻣����жϽ����Ƿ��ڽ������ʵ�ʷ�Χ��

linevector=[v1 v2 v3];
nvector1=n(1,1:3);
sign=dot(linevector,nvector1);
   t0=-(n(1,1)*tx+n(1,2)*ty+n(1,3)*tz-n(1,4))/sign;  %������Ϊ����㵽������ľ��룬signΪ�����뷢�����߽Ƕȵ�����ֵ
   if v1*t0+tx>0&&v1*t0+tx<l&&v3*t0+tz>0&&v3*t0+tz<hp
      if v2*t0+ty<wp+0.0001
        point1=[v1*t0+tx,v2*t0+ty,v3*t0+tz,t0,7];%t0Ϊ����㵽����ĳ��ȣ�7��ʾ��̨ǰ����
      else
         point1=[];
      end
   else
       point1=[];
   end
end
