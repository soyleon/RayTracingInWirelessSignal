function surface=judge1(t1,t2,t3,h,w,l,hp,wp,vx,vy,vz)
% ����λ���о��������������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����

% [t1 t2 t3]�Ƿ������߸�ƽ���ϵĽ���
%�����ж������Ƿ����������ཻ
txp=[t1 t2 t3];
PointOnPlatformFrontWall1=[t1 wp 0];
PointOnPlatformFrontWall2=[t1 wp hp];
PointOnPlatformFrontWall3=[0 wp t3];
PointOnPlatformFrontWall4=[l wp t3];
VectorToPlatformFrontWall1=PointOnPlatformFrontWall1-txp;
VectorToPlatformFrontWall2=PointOnPlatformFrontWall2-txp;
VectorToPlatformFrontWall3=PointOnPlatformFrontWall3-txp;
VectorToPlatformFrontWall4=PointOnPlatformFrontWall4-txp;
DVectorToPlatformFrontWall1=norm(VectorToPlatformFrontWall1);
DVectorToPlatformFrontWall2=norm(VectorToPlatformFrontWall2);
DVectorToPlatformFrontWall3=norm(VectorToPlatformFrontWall3);
DVectorToPlatformFrontWall4=norm(VectorToPlatformFrontWall4);
AngleVPF1VPF2=acosd(dot(VectorToPlatformFrontWall1,VectorToPlatformFrontWall2)/(DVectorToPlatformFrontWall1*DVectorToPlatformFrontWall2));%�����ж������ܷ�򵽽������
AngleVPF3VPF4=acosd(dot(VectorToPlatformFrontWall3,VectorToPlatformFrontWall4)/(DVectorToPlatformFrontWall3*DVectorToPlatformFrontWall4));%�����ж������ܷ�򵽽������
SPF1=([AngleVPF1VPF2 AngleVPF3VPF4]<180).*([AngleVPF1VPF2 AngleVPF3VPF4]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
VectorPF2=[0,vy,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ��������ǽ���ϵ�ͶӰ����
VectorPF3=[vx,vy,0];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڵ����ͶӰ����
DVPF2=norm(VectorPF2);
DVPF3=norm(VectorPF3);
AngleVPF1V2=acosd(dot(VectorToPlatformFrontWall1,VectorPF2)/(DVectorToPlatformFrontWall1*DVPF2));
AngleVPF2V2=acosd(dot(VectorToPlatformFrontWall2,VectorPF2)/(DVectorToPlatformFrontWall2*DVPF2));
AngleVPF3V3=acosd(dot(VectorToPlatformFrontWall3,VectorPF3)/(DVectorToPlatformFrontWall3*DVPF3));
AngleVPF4V3=acosd(dot(VectorToPlatformFrontWall4,VectorPF3)/(DVectorToPlatformFrontWall4*DVPF3));
APF50=abs(AngleVPF1V2+AngleVPF2V2-AngleVPF1VPF2);
APF60=abs(AngleVPF3V3+AngleVPF4V3-AngleVPF3VPF4);
SPF4=[APF50,APF60]<0.001;
SPF5=SPF1.*SPF4;
if SPF5(1,1)==1 && SPF5(1,2)==1
    surface=7;%��̨ǰ��
else
    PointOnPlatformUpWall1=[t1 0 hp];
    PointOnPlatformUpWall2=[t1 wp hp];
    PointOnPlatformUpWall3=[0 t2 hp];
    PointOnPlatformUpWall4=[l t2 hp];
    VectorToPlatformUpWall1=PointOnPlatformUpWall1-txp;
    VectorToPlatformUpWall2=PointOnPlatformUpWall2-txp;
    VectorToPlatformUpWall3=PointOnPlatformUpWall3-txp;
    VectorToPlatformUpWall4=PointOnPlatformUpWall4-txp;
    DVectorToPlatformUpWall1=norm(VectorToPlatformUpWall1);
    DVectorToPlatformUpWall2=norm(VectorToPlatformUpWall2);
    DVectorToPlatformUpWall3=norm(VectorToPlatformUpWall3);
    DVectorToPlatformUpWall4=norm(VectorToPlatformUpWall4);
    AngleVPU1VPU2=acosd(dot(VectorToPlatformUpWall1,VectorToPlatformUpWall2)/(DVectorToPlatformUpWall1*DVectorToPlatformUpWall2));%�����ж������ܷ�򵽽�̨����
    AngleVPU3VPU4=acosd(dot(VectorToPlatformUpWall3,VectorToPlatformUpWall4)/(DVectorToPlatformUpWall3*DVectorToPlatformUpWall4));%�����ж������ܷ�򵽽�̨����
    SPU1=([AngleVPU1VPU2 AngleVPU3VPU4]<180).*([AngleVPU1VPU2 AngleVPU3VPU4]>0);%ȥ��[t1 t2 t3]�ڽ�̨���������ʱs3=[1 1]
    VectorPU2=[0,vy,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ��������ǽ���ϵ�ͶӰ����
    VectorPU3=[vx,0,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڽ�������ͶӰ����
    DVPU2=norm(VectorPU2);
    DVPU3=norm(VectorPU3);
    AngleVPU1V2=acosd(dot(VectorToPlatformUpWall1,VectorPU2)/(DVectorToPlatformUpWall1*DVPU2));
    AngleVPU2V2=acosd(dot(VectorToPlatformUpWall2,VectorPU2)/(DVectorToPlatformUpWall2*DVPU2));
    AngleVPU3V3=acosd(dot(VectorToPlatformUpWall3,VectorPU3)/(DVectorToPlatformUpWall3*DVPU3));
    AngleVPU4V3=acosd(dot(VectorToPlatformUpWall4,VectorPU3)/(DVectorToPlatformUpWall4*DVPU3));
    APU50=abs(AngleVPU1V2+AngleVPU2V2-AngleVPU1VPU2);
    APU60=abs(AngleVPU3V3+AngleVPU4V3-AngleVPU3VPU4);
    SPU4=[APU50,APU60]<0.001;
    SPU5=SPU1.*SPU4;
    if SPU5(1,1)==1 && SPU5(1,2)==1
        surface=6;%��̨����
    else
        point5=[t1 0 0];
        point6=[t1 0 h];
        point7=[0 0 t3];
        point8=[l 0 t3];
        v5=point5-txp;
        v6=point6-txp;
        v7=point7-txp;
        v8=point8-txp;
        d5=norm(v5);
        d6=norm(v6);
        d7=norm(v7);
        d8=norm(v8);
        angle5=acosd(dot(v5,v6)/(d5*d6));%�����ж������ܷ�򵽽������
        angle6=acosd(dot(v7,v8)/(d7*d8));%�����ж������ܷ�򵽽������
        s3=([angle5 angle6]<180).*([angle5 angle6]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
        vector2=[0,vy,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ��������ǽ���ͶӰ����
        vector3=[vx,vy,0];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڵ����ͶӰ����
        d9=norm(vector2);
        d10=norm(vector3);
        a5=acosd(dot(v5,vector2)/(d5*d9));
        a6=acosd(dot(v6,vector2)/(d6*d9));
        a7=acosd(dot(v7,vector3)/(d7*d10));
        a8=acosd(dot(v8,vector3)/(d8*d10));
        a50=abs(a5+a6-angle5);
        a60=abs(a7+a8-angle6);
        s4=[a50,a60]<0.001;
        s5=s3.*s4;
        if s5(1,1)==1 && s5(1,2)==1
            surface=0;%���������ཻ
        else
            PointOnBehindWall1=[t1 w 0];
            PointOnBehindWall2=[t1 w h];
            PointOnBehindWall3=[0 w t3];
            PointOnBehindWall4=[l w t3];
            VectorToBehindWall1=PointOnBehindWall1-txp;
            VectorToBehindWall2=PointOnBehindWall2-txp;
            VectorToBehindWall3=PointOnBehindWall3-txp;
            VectorToBehindWall4=PointOnBehindWall4-txp;
            DVectorToBehindWall1=norm(VectorToBehindWall1);
            DVectorToBehindWall2=norm(VectorToBehindWall2);
            DVectorToBehindWall3=norm(VectorToBehindWall3);
            DVectorToBehindWall4=norm(VectorToBehindWall4);
            AngleVB1VB2=acosd(dot(VectorToBehindWall1,VectorToBehindWall2)/(DVectorToBehindWall1*DVectorToBehindWall2));%�����ж������ܷ�򵽽������
            AngleVB3VB4=acosd(dot(VectorToBehindWall3,VectorToBehindWall4)/(DVectorToBehindWall3*DVectorToBehindWall4));%�����ж������ܷ�򵽽������
            S1=([AngleVB1VB2 AngleVB3VB4]<180).*([AngleVB1VB2 AngleVB3VB4]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
            Vector2=[0,vy,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ��������ǽ���ͶӰ����
            Vector3=[vx,vy,0];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڵ����ͶӰ����
            DV2=norm(Vector2);
            DV3=norm(Vector3);
            AngleVB1V2=acosd(dot(VectorToBehindWall1,Vector2)/(DVectorToBehindWall1*DV2));
            AngleVB2V2=acosd(dot(VectorToBehindWall2,Vector2)/(DVectorToBehindWall2*DV2));
            AngleVB3V3=acosd(dot(VectorToBehindWall3,Vector3)/(DVectorToBehindWall3*DV3));
            AngleVB4V3=acosd(dot(VectorToBehindWall4,Vector3)/(DVectorToBehindWall4*DV3));
            A50=abs(AngleVB1V2+AngleVB2V2-AngleVB1VB2);
            A60=abs(AngleVB3V3+AngleVB4V3-AngleVB3VB4);
            S4=[A50,A60]<0.001;
            S5=S1.*S4;
            if S5(1,1)==1 && S5(1,2)==1
                surface=5;  %��Զ������ཻ
            else
                PointOnLeftWall1=[0 t2 0];
                PointOnLeftWall2=[0 t2 h];
                PointOnLeftWall3=[0 0 t3];
                PointOnLeftWall4=[0 w t3];
                VectorToLeftWall1=PointOnLeftWall1-txp;
                VectorToLeftWall2=PointOnLeftWall2-txp;
                VectorToLeftWall3=PointOnLeftWall3-txp;
                VectorToLeftWall4=PointOnLeftWall4-txp;
                DVectorToLeftWall1=norm(VectorToLeftWall1);
                DVectorToLeftWall2=norm(VectorToLeftWall2);
                DVectorToLeftWall3=norm(VectorToLeftWall3);
                DVectorToLeftWall4=norm(VectorToLeftWall4);
                AngleVL1VL2=acosd(dot(VectorToLeftWall1,VectorToLeftWall2)/(DVectorToLeftWall1*DVectorToLeftWall2));%�����ж������ܷ�򵽽������
                AngleVL3VL4=acosd(dot(VectorToLeftWall3,VectorToLeftWall4)/(DVectorToLeftWall3*DVectorToLeftWall4));%�����ж������ܷ�򵽽������
                SL1=([AngleVL1VL2 AngleVL3VL4]<180).*([AngleVL1VL2 AngleVL3VL4]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
                VectorL2=[vx,0,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڽ�������ϵ�ͶӰ����
                VectorL3=[vx,vy,0];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڵ����ͶӰ����
                DVL2=norm(VectorL2);
                DVL3=norm(VectorL3);
                AngleVL1V2=acosd(dot(VectorToLeftWall1,VectorL2)/(DVectorToLeftWall1*DVL2));
                AngleVL2V2=acosd(dot(VectorToLeftWall2,VectorL2)/(DVectorToLeftWall2*DVL2));
                AngleVL3V3=acosd(dot(VectorToLeftWall3,VectorL3)/(DVectorToLeftWall3*DVL3));
                AngleVL4V3=acosd(dot(VectorToLeftWall4,VectorL3)/(DVectorToLeftWall4*DVL3));
                AL50=abs(AngleVL1V2+AngleVL2V2-AngleVL1VL2);
                AL60=abs(AngleVL3V3+AngleVL4V3-AngleVL3VL4);
                SL4=[AL50,AL60]<0.001;
                SL5=SL1.*SL4;
                if SL5(1,1)==1 && SL5(1,2)==1
                    surface=3;%����ǽ���ཻ
                else
                    PointOnRightWall1=[l t2 0];
                    PointOnRightWall2=[l t2 h];
                    PointOnRightWall3=[l 0 t3];
                    PointOnRightWall4=[l w t3];
                    VectorToRightWall1=PointOnRightWall1-txp;
                    VectorToRightWall2=PointOnRightWall2-txp;
                    VectorToRightWall3=PointOnRightWall3-txp;
                    VectorToRightWall4=PointOnRightWall4-txp;
                    DVectorToRightWall1=norm(VectorToRightWall1);
                    DVectorToRightWall2=norm(VectorToRightWall2);
                    DVectorToRightWall3=norm(VectorToRightWall3);
                    DVectorToRightWall4=norm(VectorToRightWall4);
                    AngleVR1VR2=acosd(dot(VectorToRightWall1,VectorToRightWall2)/(DVectorToRightWall1*DVectorToRightWall2));%�����ж������ܷ�򵽽������
                    AngleVR3VR4=acosd(dot(VectorToRightWall3,VectorToRightWall4)/(DVectorToRightWall3*DVectorToRightWall4));%�����ж������ܷ�򵽽������
                    SR1=([AngleVR1VR2 AngleVR3VR4]<180).*([AngleVR1VR2 AngleVR3VR4]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
                    VectorR2=[vx,0,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڽ�������ϵ�ͶӰ����
                    VectorR3=[vx,vy,0];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڵ����ͶӰ����
                    DVR2=norm(VectorR2);
                    DVR3=norm(VectorR3);
                    AngleVR1V2=acosd(dot(VectorToRightWall1,VectorR2)/(DVectorToRightWall1*DVR2));
                    AngleVR2V2=acosd(dot(VectorToRightWall2,VectorR2)/(DVectorToRightWall2*DVR2));
                    AngleVR3V3=acosd(dot(VectorToRightWall3,VectorR3)/(DVectorToRightWall3*DVR3));
                    AngleVR4V3=acosd(dot(VectorToRightWall4,VectorR3)/(DVectorToRightWall4*DVR3));
                    AR50=abs(AngleVR1V2+AngleVR2V2-AngleVR1VR2);
                    AR60=abs(AngleVR3V3+AngleVR4V3-AngleVR3VR4);
                    SR4=[AR50,AR60]<0.001;
                    SR5=SR1.*SR4;
                    if SR5(1,1)==1 && SR5(1,2)==1
                        surface=4;%����ǽ���ཻ
                    else
                        PointOnFloorWall1=[t1 0 0];
                        PointOnFloorWall2=[t1 w 0];
                        PointOnFloorWall3=[0 t2 0];
                        PointOnFloorWall4=[l t2 0];
                        VectorToFloorWall1=PointOnFloorWall1-txp;
                        VectorToFloorWall2=PointOnFloorWall2-txp;
                        VectorToFloorWall3=PointOnFloorWall3-txp;
                        VectorToFloorWall4=PointOnFloorWall4-txp;
                        DVectorToFloorWall1=norm(VectorToFloorWall1);
                        DVectorToFloorWall2=norm(VectorToFloorWall2);
                        DVectorToFloorWall3=norm(VectorToFloorWall3);
                        DVectorToFloorWall4=norm(VectorToFloorWall4);
                        AngleVF1VF2=acosd(dot(VectorToFloorWall1,VectorToFloorWall2)/(DVectorToFloorWall1*DVectorToFloorWall2));%�����ж������ܷ�򵽽������
                        AngleVF3VF4=acosd(dot(VectorToFloorWall3,VectorToFloorWall4)/(DVectorToFloorWall3*DVectorToFloorWall4));%�����ж������ܷ�򵽽������
                        SF1=([AngleVF1VF2 AngleVF3VF4]<180).*([AngleVF1VF2 AngleVF3VF4]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
                        VectorF2=[0,vy,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ��������ǽ���ϵ�ͶӰ����
                        VectorF3=[vx,0,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڽ���������ͶӰ����
                        DVF2=norm(VectorF2);
                        DVF3=norm(VectorF3);
                        AngleVF1V2=acosd(dot(VectorToFloorWall1,VectorF2)/(DVectorToFloorWall1*DVF2));
                        AngleVF2V2=acosd(dot(VectorToFloorWall2,VectorF2)/(DVectorToFloorWall2*DVF2));
                        AngleVF3V3=acosd(dot(VectorToFloorWall3,VectorF3)/(DVectorToFloorWall3*DVF3));
                        AngleVF4V3=acosd(dot(VectorToFloorWall4,VectorF3)/(DVectorToFloorWall4*DVF3));
                        AF50=abs(AngleVF1V2+AngleVF2V2-AngleVF1VF2);
                        AF60=abs(AngleVF3V3+AngleVF4V3-AngleVF3VF4);
                        SF4=[AF50,AF60]<0.001;
                        SF5=SF1.*SF4;
                        if SF5(1,1)==1 && SF5(1,2)==1
                            surface=1;%������ཻ
                        else
                            PointOnCeilingWall1=[t1 0 h];
                            PointOnCeilingWall2=[t1 w h];
                            PointOnCeilingWall3=[0 t2 h];
                            PointOnCeilingWall4=[l t2 h];
                            VectorToCeilingWall1=PointOnCeilingWall1-txp;
                            VectorToCeilingWall2=PointOnCeilingWall2-txp;
                            VectorToCeilingWall3=PointOnCeilingWall3-txp;
                            VectorToCeilingWall4=PointOnCeilingWall4-txp;
                            DVectorToCeilingWall1=norm(VectorToCeilingWall1);
                            DVectorToCeilingWall2=norm(VectorToCeilingWall2);
                            DVectorToCeilingWall3=norm(VectorToCeilingWall3);
                            DVectorToCeilingWall4=norm(VectorToCeilingWall4);
                            AngleVC1VC2=acosd(dot(VectorToCeilingWall1,VectorToCeilingWall2)/(DVectorToCeilingWall1*DVectorToCeilingWall2));%�����ж������ܷ�򵽽������
                            AngleVC3VC4=acosd(dot(VectorToCeilingWall3,VectorToCeilingWall4)/(DVectorToCeilingWall3*DVectorToCeilingWall4));%�����ж������ܷ�򵽽������
                            SC1=([AngleVC1VC2 AngleVC3VC4]<180).*([AngleVC1VC2 AngleVC3VC4]>0);%ȥ��[t1 t2 t3]�ڽ�������ϵ��������ʱs3=[1 1]
                            VectorC2=[0,vy,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ��������ǽ���ϵ�ͶӰ����
                            VectorC3=[vx,0,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�����ڽ�������ͶӰ����
                            DVC2=norm(VectorC2);
                            DVC3=norm(VectorC3);
                            AngleVC1V2=acosd(dot(VectorToCeilingWall1,VectorC2)/(DVectorToCeilingWall1*DVC2));
                            AngleVC2V2=acosd(dot(VectorToCeilingWall2,VectorC2)/(DVectorToCeilingWall2*DVC2));
                            AngleVC3V3=acosd(dot(VectorToCeilingWall3,VectorC3)/(DVectorToCeilingWall3*DVC3));
                            AngleVC4V3=acosd(dot(VectorToCeilingWall4,VectorC3)/(DVectorToCeilingWall4*DVC3));
                            AC50=abs(AngleVC1V2+AngleVC2V2-AngleVC1VC2);
                            AC60=abs(AngleVC3V3+AngleVC4V3-AngleVC3VC4);
                            SC4=[AC50,AC60]<0.001;
                            SC5=SC1.*SC4;
                            if SC5(1,1)==1 && SC5(1,2)==1
                                surface=2;%�붥���ཻ
                            end
                        end
                    end
                end
            end
        end
    end
end
    
    %     %����յ�ķ����򴫲�������յ�֮ǰ�������ĸ�����
    %     point1=[0 t2 0];
    %     point2=[l t2 0];
    %     point3=[l t2 h];
    %     point4=[0 t2 h];
    %     v1=point1-tx;
    %     v2=point2-tx;
    %     v3=point3-tx;
    %     v4=point4-tx;
    %     d1=norm(v1);
    %     d2=norm(v2);
    %     d3=norm(v3);
    %     d4=norm(v4);
    %     angle1=acosd(dot(v1,v2)/(d1*d2));
    %     angle2=acosd(dot(v3,v4)/(d3*d4));
    %     angle3=acosd(dot(v1,v4)/(d1*d4));
    %     angle4=acosd(dot(v3,v2)/(d3*d2));%��Ӧ����
    %     s1=([angle1 angle2 angle3 angle4]<180).*([angle1 angle2 angle3 angle4]>0);%ȥ��[t1 t2 t3]��ĳ�����ϵ��������ʱs1=[1 1 1 1]
    %     vector1=[vx,0,vz];%��tx����ķ��������ǣ�vx,vy,vz���ĵ�λ�������������ͶӰ����
    %     d11=norm(vector1);
    %     a1=acosd(dot(v1,vector1)/(d1*d11));
    %     a2=acosd(dot(v2,vector1)/(d2*d11));
    %     a3=acosd(dot(v3,vector1)/(d3*d11));
    %     a4=acosd(dot(v4,vector1)/(d4*d11));
    %     a10=abs(a1+a2-angle1);
    %     a20=abs(a3+a4-angle2);
    %     a30=abs(a1+a4-angle3);
    %     a40=abs(a2+a3-angle4);
    %     s2=[a10,a20,a30,a40]<0.001;
    %     [s,surface]=find(s1.*s2);  %�������ƽ���󽻵�λ�ã�s��ʾԪ���е�λ�ã�surface��ʾԪ���е�λ�ã���ȷ���ཻ��
    %     if isempty(surface) == 1
    %         surface = 0;
    %     end