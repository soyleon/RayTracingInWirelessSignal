   M S B A M L   `   `   `  ����  I-RayTracer    I_RayTracer.IndoorWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5        $��Indoor_window��5        � Title$  IndoorWindow��6	   $	��400��63   $	��600��6@    � 
ResizeMode$ CanResizeWithGrip=�6L   .��5      � .+�5   
   o� -   5         o�Name$ I_RayTracer_Indoor_Menu��5      $	��Top=�60   $��20��6H   .@�5      m� -   5         m�Name$ IndoorWindow_Menu_File��5      $
��File��67   .@�5      m� -   5        $! IndoorWindow_Menu_File_Open��5      $
��Open��6@   m� 5	      -   5        $! IndoorWindow_Menu_File_Save��5	      $
��Save��6@   m� 5
      -   5        $  IndoorWindow_Menu_File_New��5
      $	��New��6?   m� 5      -   5        $! IndoorWindow_Menu_File_Exit��5      $
��Exit��6@   5      m� 5      -   5        $ IndoorWindow_Menu_Edit��5      $
��Edit��67   5      m� 5      -	   5        $ IndoorWindow_Menu_View��5      $
��View��67   5      m� 5      -
   5        $ IndoorWindow_Menu_Project��5      $��Project��6:   5      m� 5      -   5        $ IndoorWindow_Menu_Window��5      $��Window��69   5      m� 5      -   5        $ IndoorWindow_Menu_Help��5      $
��Help��67   5      5      � 5   
   $��0,20,0,0q�6   .+�5      �� $��3q�6    J� RenderTransformOrigin$ 0.566,0.639&�6$   .@�5      �� -   5         ��Name$ IndoorWindows_SceneDesign��5      $��Scene Design��6?   .��5      � .+�5      ]� .+�5      �� -   5         ��Name$ Indoor_Button_Return��5   %   $��20��6C   
����ح�$��Return��6f   $	��Top=�6�   $
��Left=�6�   $	��100��6�   $��10q�6�   �� 5      -   5        $ Indoor_Button_Fopen��5   %   $��20��6B   
����ح�$��FileOpen��6e   $
��Left=�6x   $	��100��6�   $	��Top=�6�   $��10q�6�   �� 5      -   5         ��Name$ Indoor_TextBox_FileName��5   &   $��20��6G   
�������$
��Left=�6f   $	��Top=�6�   $	��200��6�   $��10q�6�   5       � 5!      $��0,40,0,0q�6   .+�5"      �� -   5         ��Name$  IndoorWindow_Scene_Display��5"   %   $��0,0,0,0q�6I   $��1��6Z   
������5#      5$      5%      5&      �� 5'      -   5        $* $IndoorWindows_SceneParametersSetting��5'      $��Scene Parameters Settings��6H   .��5)      � ���	#FFE5E5E5.+�5*      ]� .+�5+      �� $��Choose Object��6$   $
��Left=�6<   $	��Top=�6W   �� 5,      -   5        	 ��Name$"	 Indoor_Window_ObjectSelected��5,   '   $
��Left=�6M   $	��Top=�6h   $	��120��6�   .@�5-   "   �� -   5        
 ��Name$
 Indoor_Window_Object_Wall��5-   /   $��3q�6R   $
��Wall��6]   �� 5.   "   -   5        $ 
 Indoor_Window_Object_Table��5.   /   $��3q�6S   $��Table��6^   �� 5/   "   -   5        $
 Indoor_Window_Object_Seat��5/   /   $��3q�6R   $
��Seat��6]   �� 50   "   -   5        $!
 Indoor_Window_Object_Window��50   /   $��3q�6T   $��Window��6_   �� 51   "   -   5        $#
 Indoor_Window_Object_Cupboard��51   /   $��3q�6V   $��Cupboard��6a   �� 52   "   -   5        $
 Indoor_Window_Object_Door��52   /   $��3q�6R   $
��Door��6]   �� 53   "   -   5        $!
 Indoor_Window_Object_Others��53   /   $��3q�6T   $��Others��6_   54      55      � 56      $��0,30,0,0q�6   .+�57      &   System.Windows.Controls.DataGrid  -   5          Name$# Indoor_Window_Object_Material��57   '      AutoGenerateColumns .  $
��Left=�6�   $	��Top=�6�   ��6N   ��    Columns 58   "   4  .System.Windows.Controls.DataGridTemplateColumn  59   &   -   5        $ Indoor_DataGridTextColumn_Object��,  &System.Windows.Controls.DataGridColumn   Header$ Object��59   g      Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6w      
IsReadOnly .     CellTemplate 5:   *   �� 5;   .   .R�5<   2   �� ��6:   �� *Scene_object+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5=   /   5?   '     5A   &   -   5        &"Indoor_DataGridTextColumn_Material��$ Material��5A   i   $	 100 6{    5B   *   �� 5C   .   .R�5D   2   �� ��6:   �� *
Material+$ TwoWay=�$ PropertyChanged=�5E   /   5G   '     5I   &   -   5        *&Indoor_DataGridTextColumn_Conductivity��$ Conductivity��5I   m   $	 100 6�    5J   *   �� 5K   .   .R�5L   2   �� ��6:   �� *Conductivity+$ TwoWay=�$ PropertyChanged=�5M   /   5O   '     5Q   &   -   5        )%Indoor_DataGridTextColumn_Permitivity��$ Permitivity��5Q   l   $	 100 6�    5R   *   �� 5S   .   .R�5T   2   �� ��6:   �� *Permitivity+$ TwoWay=�$ PropertyChanged=�5U   /   5W   '     5Y   &   -    5        &"Indoor_DataGridTextColumn_Location��$ Location��5Y   i   $	 100 6{    5Z   *   �� 5[   .   .R�5\   2   �� ��6:   �� *
Location+$ TwoWay=�$ PropertyChanged=�5]   /   5_   '   5a      ]� 5b      .+�5c   "   �� -!   5        $%��Indoor_SceneParamterSetting_Add��5c   9   $	��Add��6)   $
��Left=�6�   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5d   "   -"   5        $&�� Indoor_SceneParamterSetting_Save��5d   9   $
��Save��6)   $
��Left=�6�   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5e   "   -#   5        $(��"Indoor_SceneParamterSetting_Delete��5e   ;   $��Delete��6)   $
��Left=�6�   $��Bottom=�6�   $	��100��6�   $��20��6�   5f      5g      5h      5i      �� 5j      -$   5        $" IndoorWindows_AntennaSetting��5j      $��Antenna Setting��6@   .��5k      � ���	#FFE5E5E5 � ColumnDefinitions 5l      �� 5m      $
��155* �6/   �� 5n      $
��421* �6/   .+�5p        -%   5        $# Indoor_Window_Antenna_Setting��5p   #   $
��Left=�6c   $	��Top=�6~    .  $��2��6�   ��6J   ��  5q        5r   "   -&   5        %!Indoor_DataGridTextColumn_Antenna��$ Antenna��5r   d   $ 80 6u    5s   &   �� 5t   *   .R�5u   .   �� 5v   /   5w   +   5y   #   0  *System.Windows.Controls.DataGridTextColumn  5z   "   -'   5        )%Indoor_DataGridTextColumn_AntennaType��$ AntennaType��5z   d   $	 100 6y   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6�   �� *
Material+$ TwoWay=�$ PropertyChanged=�  5{   "   -(   5        *&Indoor_DataGridTextColumn_AntennaAngle��$ Angle��5{   e   $	 100 6t    6�   �� *conductivity+$ TwoWay=�$ PropertyChanged=�  5|   "   -)   5        )%Indoor_DataGridTextColumn_AntennaGain��$
 Gain��5|   d   $	 100 6r    6~   �� *Permitivity+$ TwoWay=�$ PropertyChanged=�  5}   "   -*   5        -)Indoor_DataGridTextColumn_AntennaLocation��$ AntennaLocation��5}   h   $	 100 6�    6�   �� *
Location+$ TwoWay=�$ PropertyChanged=�.@�5        -+   5        $%��Indoor_AntennaSetting_DataGrid1��5   '    .     CanUserAddRows .  5�      5�      ]� 5�      $��2��6$   .+�5�      �� -,   5        $��Indoor_Antenna_Add��5�   5   $	��Add��6%   $
��Left=�6q   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5�      --   5        $��Indoor_Antenna_Save��5�   5   $
��Save��6%   $
��Left=�6r   $��Bottom=�6�   $	��100��6�   $��20��6�   �� 5�      -.   5        $��Indoor_Antenna_Delete��5�   7   $��Delete��6%   $
��Left=�6x   $��Bottom=�6�   $	��100��6�   $��20��6�   5�      5�      5�      �� 5�      -/   5        $% IndoorWindows_SimulationSetting��5�      $��Simulation Setting��6C   .��5�      � ���	#FFE5E5E5.+�5�      �  5�      �� 5�   "   $	��25* �63   �� 5�   "   $
��119* �63   �� 5�   "   $
��144* �63   �� 5�   "   $
��144* �63   �� 5�   "   $
��144* �63    � RowDefinitions 5�      �� 5�   "   �� 5�   "   �� 5�   "   �� 5�   "   �� 5�   "   �� 5�   "   �� 5�   "   .+�5�      �� $#��Simulation Paremeters Setting��6$   $��20(�6L   
�������$��0��6m   $��5��6z   $
��Bold"�6�   $��Italic$�6�   6�   �� 5�      $��Tx Power��6$   $��Center=�67   $��Center=�6R   $��1��6o   $��1��6   $��	16,9,41,9q�6�   6�   �� 5�      -0   5        $��Power_Tx_textbox��5�   &   $��2��6>   $��1��6N   $��5q�6[   ��6f   ��  �� Path$ Power_Tx��� 5�      $��Tx Frequency��6$   $��Center=�6;   $��Center=�6V   $��1��6s   $��2��6�   $��	4,9,29,10q�6�   6�   �� 5�      -1   5        $��Frequency_Tx_textbox��5�   &   $��2��6B   $��2��6R   $��5q�6_   ��6j   �� $ Frequency_Tx��� 5�      $��Max Reflection��6$   $��Center=�6=   $��Center=�6X   $��0��6u   $��3��6�   $��2��6�   $
��24,9q�6�   6�   �� 5�      -2   5        $��Max_reflection_textbox��5�   &   $��2��6D   $��3��6T   $��5q�6a   ��6l   �� $ Max_reflection��� 5�      $��Max Diffraction��6$   $��Center=�6>   $��Center=�6Y   $��0��6v   $��4��6�   $��2��6�   $��
22,10,22,9q�6�   6�   �� 5�      -3   5        $��Max_diffraction_textbox��5�   &   $��2��6E   $��4��6U   $��5q�6b   ��6m   �� $ Max_diffraction��� 5�      $��Max Scattering��6$   $��Center=�6=   $��Center=�6X   $��0��6u   $��5��6�   $��2��6�   $
��24,9q�6�   6�   �� 5�      -4   5        $��Max_Scattering_textbox��5�   &   $��2��6D   $��5��6T   $��5q�6a   ��6l   �� $ Max_scattering��� 5�      $��Doppler Shift��6$   $��Center=�6<   $��Center=�6W   $��1��6t   $��6��6�   $��	4,9,29,10q�6�   6�   �� 5�      -5   5        $��Dopplershift_textbox��5�   &   $��2��6B   $��6��6R   $��5q�6_   ��6j   �� $ Dopplershift��� 5�      $��	BandWidth��6$   $��Center=�68   $��Center=�6S   $��3��6p   $��1��6�   $
��35,9q�6�   6�   �� 5�      -6   5        $��Bandwidth_textbox��5�   &   $��4��6?   $��1��6O   $��5q�6\   ��6g   �� $ 	Bandwidth��� 5�      $��	Noise Mod��6$   $��Center=�68   $��Center=�6S   $��3��6p   $��2��6�   $��
35,9,35,10q�6�   6�   �� 5�      -7   5        $��Noisemod_textbox��5�   &   $��4��6>   $��2��6N   $��5q�6[   ��6f   �� $ Noisemod��� 5�      $��Rx Threshold��6$   $��Center=�6;   $��Center=�6V   $��3��6s   $��3��6�   $
��30,9q�6�   6�   �� 5�      -8   5        $��Threshold_Rx_textbox��5�   &   $��4��6B   $��3��6R   $��5q�6_   ��6j   �� $ Threshold_Rx��� 5�      -9   5        $# IndoorWindow_Simulation_Apply��5�   %   $��Apply��6L   $��3��6\   $��5��6l   $��5q�6y   6�   �� 5�      -:   5        $" IndoorWindow_Simulation_Eixt��5�   %   $
��Exit��6K   $��4��6Z   $��5��6j   $��5q�6w   6�   5�      5�      5�      5�      5�      5�      5�      