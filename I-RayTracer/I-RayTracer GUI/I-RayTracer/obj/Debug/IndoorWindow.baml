   M S B A M L   `   `   `  ����  I-RayTracer    I_RayTracer.IndoorWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  IndoorWindow��5   	   $	��400��6   $	��600��6+    � 
ResizeMode$ CanResizeWithGrip=�67   .��5      � .+�5   
   o� -   5         o�Name$ I_RayTracer_Indoor_Menu��5      $	��Top=�60   $��20��6H   .@�5      m� -   5         m�Name$ IndoorWindow_Menu_File��5      $
��File��67   .@�5      m� -   5        $! IndoorWindow_Menu_File_Open��5      $
��Open��6@   m� 5	      -   5        $! IndoorWindow_Menu_File_Save��5	      $
��Save��6@   m� 5
      -   5        $  IndoorWindow_Menu_File_New��5
      $	��New��6?   m� 5      -   5        $! IndoorWindow_Menu_File_Exit��5      $
��Exit��6@   5      m� 5      -   5        $ IndoorWindow_Menu_Edit��5      $
��Edit��67   5      m� 5      -   5        $ IndoorWindow_Menu_View��5      $
��View��67   5      m� 5      -	   5        $ IndoorWindow_Menu_Project��5      $��Project��6:   5      m� 5      -
   5        $ IndoorWindow_Menu_Window��5      $��Window��69   5      m� 5      -   5        $ IndoorWindow_Menu_Help��5      $
��Help��67   5      5      � 5   
   $��0,20,0,0q�6   .+�5      �� $��3q�6    J� RenderTransformOrigin$ 0.566,0.639&�6$   .@�5      �� -   5         ��Name$ IndoorWindows_SceneDesign��5      $��Scene Design��6?   .��5      � .+�5      ]� .+�5      �� -   5         ��Name$ Indoor_Button_Return��5   %   $��20��6C   
����ح�$��Return��6f   $	��Top=�6�   $
��Left=�6�   $	��100��6�   $��10q�6�   �� 5      -   5        $ Indoor_Button_Fopen��5   %   $��20��6B   
����ح�$��FileOpen��6e   $
��Left=�6x   $	��100��6�   $	��Top=�6�   $��10q�6�   �� 5      -   5         ��Name$ Indoor_TextBox_FileName��5   &   $��20��6G   
�������$
��Left=�6f   $	��Top=�6�   $	��200��6�   $��10q�6�   5       � 5!      $��0,40,0,0q�6   .+�5"      �� -   5         ��Name$  IndoorWindow_Scene_Display��5"   %   $��0,0,0,0q�6I   $��1��6Z   
������5#      5$      5%      5&      �� 5'      -   5        $* $IndoorWindows_SceneParametersSetting��5'      $��Scene Parameters Settings��6H   .��5)      � ���	#FFE5E5E5.+�5*      ]� .+�5+      �� $��Choose Object��6$   $
��Left=�6<   $	��Top=�6W   �� 5,      -   5        	 ��Name$"	 Indoor_Window_ObjectSelected��5,   '   $
��Left=�6M   $	��Top=�6h   $	��120��6�   .@�5-   "   �� -   5        
 ��Name$
 Indoor_Window_Object_Wall��5-   /   $��3q�6R   $
��Wall��6]   �� 5.   "   -   5        $ 
 Indoor_Window_Object_Table��5.   /   $��3q�6S   $��Table��6^   �� 5/   "   -   5        $
 Indoor_Window_Object_Seat��5/   /   $��3q�6R   $
��Seat��6]   �� 50   "   -   5        $!
 Indoor_Window_Object_Window��50   /   $��3q�6T   $��Window��6_   �� 51   "   -   5        $#
 Indoor_Window_Object_Cupboard��51   /   $��3q�6V   $��Cupboard��6a   �� 52   "   -   5        $
 Indoor_Window_Object_Door��52   /   $��3q�6R   $
��Door��6]   �� 53   "   -   5        $!
 Indoor_Window_Object_Others��53   /   $��3q�6T   $��Others��6_   54      55      � 56      $��0,30,0,0q�6   .+�57      &   System.Windows.Controls.DataGrid  -   5          Name$# Indoor_Window_Object_Material��57   '   $
��Left=�6N   $	��Top=�6i      AutoGenerateColumns .     Columns 58   "   4  .System.Windows.Controls.DataGridTemplateColumn  59   &   -   5        $ Indoor_DataGridTextColumn_Object��,  &System.Windows.Controls.DataGridColumn   Header$ Object��59   g      Width5  /System.Windows.Controls.DataGridLengthConverter$ 80 6w      CellTemplate 5:   *   �� 5;   .   .R�5<   2   �� 5=   3   5>   /   5@   '   0  *System.Windows.Controls.DataGridTextColumn  5A   &   -   5        &"Indoor_DataGridTextColumn_Material��$ Material��5A   e   $	 100 6w   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6�   �� *
Material+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�  5B   &   -   5        *&Indoor_DataGridTextColumn_Conductivity��$ Conductivity��5B   i   $	 100 6    6�   �� *conductivity+$ TwoWay=�$ PropertyChanged=�  5C   &   -   5        )%Indoor_DataGridTextColumn_Permitivity��$ Permitivity��5C   h   $	 100 6}    6�   �� *Permitivity+$ TwoWay=�$ PropertyChanged=�  5D   &   -   5        &"Indoor_DataGridTextColumn_Location��$ Location��5D   e   $	 100 6w    6�   �� *
Location+$ TwoWay=�$ PropertyChanged=�.@�5F   "     -    5        $,��&Indoor_ScemeParameterSetting_DataGrid1��5F   +    .     CanUserAddRows .  5H   #   5I      ]� 5J      .+�5K   "   �� -!   5        $%��Indoor_SceneParamterSetting_Add��5K   9   $	��Add��6)   $
��Left=�6�   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5L   "   -"   5        $&�� Indoor_SceneParamterSetting_Save��5L   9   $
��Save��6)   $
��Left=�6�   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5M   "   -#   5        $(��"Indoor_SceneParamterSetting_Delete��5M   ;   $��Delete��6)   $
��Left=�6�   $��Bottom=�6�   $	��100��6�   $��20��6�   5N      5O      5P      5Q      �� 5R      -$   5        $" IndoorWindows_AntennaSetting��5R      $��Antenna Setting��6@   .��5S      � ���	#FFE5E5E5.+�5T        -%   5        $# Indoor_Window_Antenna_Setting��5T   #   $
��Left=�6J   $	��Top=�6e    .   5U        5V   "   -&   5        %!Indoor_DataGridTextColumn_Antenna��$ Antenna��5V   d   $ 80 6u    5W   &   �� 5X   *   .R�5Y   .   �� 5Z   /   5[   +   5]   #     5^   "   -'   5        )%Indoor_DataGridTextColumn_AntennaType��$ AntennaType��5^   d   $	 100 6y    6�   �� *
Material+$ TwoWay=�$ PropertyChanged=�  5_   "   -(   5        *&Indoor_DataGridTextColumn_AntennaAngle��$ Angle��5_   e   $	 100 6t    6�   �� *conductivity+$ TwoWay=�$ PropertyChanged=�  5`   "   -)   5        )%Indoor_DataGridTextColumn_AntennaGain��$
 Gain��5`   d   $	 100 6r    6~   �� *Permitivity+$ TwoWay=�$ PropertyChanged=�  5a   "   -*   5        -)Indoor_DataGridTextColumn_AntennaLocation��$ AntennaLocation��5a   h   $	 100 6�    6�   �� *
Location+$ TwoWay=�$ PropertyChanged=�.@�5c        -+   5        $%��Indoor_AntennaSetting_DataGrid1��5c   '    .   .  5e      5f      ]� 5g      .+�5h      �� -,   5        $��Indoor_Antenna_Add��5h   5   $	��Add��6%   $
��Left=�6q   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5i      --   5        $��Indoor_Antenna_Save��5i   5   $
��Save��6%   $
��Left=�6r   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5j      -.   5        $��Indoor_Antenna_Delete��5j   7   $��Delete��6%   $
��Left=�6x   $��Bottom=�6�   $	��100��6�   $��20��6�   5k      5l      5m      �� 5n      -/   5        $% IndoorWindows_SimulationSetting��5n      $��Simulation Setting��6C   .��5o      � ���	#FFE5E5E5.+�5p      �  � ColumnDefinitions 5q      �� 5r   "   �� 5s   "   �� 5t   "   �� 5u   "    � RowDefinitions 5w      �� 5x   "   �� 5y   "   �� 5z   "   �� 5{   "   �� 5|   "   �� 5}   "   �� 5~   "   .+�5�      �� $#��Simulation Paremeters Setting��6$   $��20(�6L   
�������$��0��6m   $��4��6z   $
��Bold"�6�   $��Italic$�6�   6�   �� 5�      $��Tx Power��6$   $��Center=�67   $��Center=�6R   $��0��6o   $��1��6   6�   �� 5�      $��1��6&   $��1��66   $��5q�6C   �� 5�      $��Tx Frequency��6$   $��Center=�6;   $��Center=�6V   $��0��6s   $��2��6�   6�   �� 5�      $��1��6&   $��2��66   $��5q�6C   �� 5�      $��Max Reflection��6$   $��Center=�6=   $��Center=�6X   $��0��6u   $��3��6�   6�   �� 5�      $��1��6&   $��3��66   $��5q�6C   �� 5�      $��Max Diffraction��6$   $��Center=�6>   $��Center=�6Y   $��0��6v   $��4��6�   6�   �� 5�      $��1��6&   $��4��66   $��5q�6C   �� 5�      $��Max Scattering��6$   $��Center=�6=   $��Center=�6X   $��0��6u   $��5��6�   6�   �� 5�      $��1��6&   $��5��66   $��5q�6C   �� 5�      $��Doppler Shift��6$   $��Center=�6<   $��Center=�6W   $��0��6t   $��6��6�   6�   �� 5�      $��1��6&   $��6��66   $��5q�6C   �� 5�      $��	BandWidth��6$   $��Center=�68   $��Center=�6S   $��2��6p   $��1��6�   6�   �� 5�      $��3��6&   $��1��66   $��5q�6C   �� 5�      $��	Noise Mod��6$   $��Center=�68   $��Center=�6S   $��2��6p   $��2��6�   6�   �� 5�      $��3��6&   $��2��66   $��5q�6C   �� 5�      $��Rx Threshold��6$   $��Center=�6;   $��Center=�6V   $��2��6s   $��3��6�   6�   �� 5�      $��3��6&   $��3��66   $��5q�6C   �� 5�      -0   5        $# IndoorWindow_Simulation_Apply��5�   %   $��Apply��6L   $��2��6\   $��5��6l   $��5q�6y   6�   �� 5�      -1   5        $" IndoorWindow_Simulation_Eixt��5�   %   $
��Exit��6K   $��3��6Z   $��5��6j   $��5q�6w   6�   5�      5�      5�      5�      5�      5�      5�      