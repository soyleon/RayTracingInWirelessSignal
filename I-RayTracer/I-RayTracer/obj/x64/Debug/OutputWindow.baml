   M S B A M L   `   `   `  ����  I-RayTracer    I_RayTracer.OutputWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          �Name$  IRayTracing_Output_Window��5   	    � Title$ OutputWindow��5   	   $	��500��6   $	��700��6+    � 
ResizeMode$ CanResizeWithGrip=�67   .��5      � .+�5   
   o� -   5         o�Name$ I_RayTracer_Indoor_Menu��5      $	��Top=�60   $��20��6H   .@�5      m� -   5         m�Name$ IndoorWindow_Menu_File��5      $
��File��67   .@�5      m� -   5        $! IndoorWindow_Menu_File_Open��5      $
��Open��6@   m� 5	      -   5        $! IndoorWindow_Menu_File_Save��5	      $
��Save��6@   m� 5
      -   5        $  IndoorWindow_Menu_File_New��5
      $	��New��6?   m� 5      -   5        $! IndoorWindow_Menu_File_Exit��5      $
��Exit��6@   5      m� 5      -   5        $ IndoorWindow_Menu_Edit��5      $
��Edit��67   5      m� 5      -	   5        $ IndoorWindow_Menu_View��5      $
��View��67   5      m� 5      -
   5        $ IndoorWindow_Menu_Project��5      $��Project��6:   5      m� 5      -   5        $ IndoorWindow_Menu_Window��5      $��Window��69   5      m� 5      -   5        $ IndoorWindow_Menu_Help��5      $
��Help��67   5      5      � 5   
   $��0,20,0,0q�6    � ColumnDefinitions 5      �� 5      $
��150* �6#   �� 5      $
��225* �6#   �� 5      $
��225* �6#    � RowDefinitions 5      �� 5      �� 5       .+�5"      � $��0��6   $��0��6#   .+�5#      &   System.Windows.Controls.DataGrid  -   5          Name$# Output_Window_PathInformation��5#      $
��Left=�6B   $	��Top=�6]      AutoGenerateColumns .  	   Columns	 5$      4  .System.Windows.Controls.DataGridTemplateColumn  5%      -   5        "Output_DataGridTextColumn_Path��,  &System.Windows.Controls.DataGridColumn
   Header$

 Path��5%   Y      Width5  /System.Windows.Controls.DataGridLengthConverter$ 80 6g      CellTemplate 5&      �� 5'   "   .R�5(   &   �� 5)   '   5*   #   5,      0  *System.Windows.Controls.DataGridTextColumn  5-      -   5        ($Output_DataGridTextColumn_PathNumber��$
 
PathNumber��5-   [   $	 100 6o   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6{   �� *
PathNumber+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�  5.      -   5        &"Output_DataGridTextColumn_PathLoss��$
 Pathloss��5.   Y   $	 100 6k    6w   �� *
Pathloss+$ TwoWay=�$ PropertyChanged=�  5/      -   5        *&Output_DataGridTextColumn_ArrivalAngle��$
 ArrivalAngle��5/   ]   $	 100 6s    6   �� *ArrivalAngle+$ TwoWay=�$ PropertyChanged=�  50      -   5        '#Output_DataGridTextColumn_TimeDelay��$
 	TimeDelay��50   Z   $	 100 6m    6y   �� *	TimeDelay+$ TwoWay=�$ PropertyChanged=�  51      -   5        -)Output_DataGridTextColumn_ReflectionTimes��$
 ReflectionTimes��51   `   $	 100 6y    6�   �� *ReflectionTimes+$ TwoWay=�$ PropertyChanged=�.@�53        -   5        $ ��OutputWindow_PathDataGrid1��53       .     CanUserAddRows .  55        56      6!     57      6!     58      6!     59      6!     5:      6!     5;      6!     5<      6!   5=      5>      � 5?      $��0��6   $��1��6#   .+�5@        -   5        $' !Output_Window_ReceiverInformation��5@      $
��Left=�6F   $	��Top=�6a    .  	 5A        5B      -   5        &"Output_DataGridTextColumn_Receiver��$
 Receiver��5B   ]   $ 80 6o    5C      �� 5D   "   5E   #   5G        5H      -   5        ,(Output_DataGridTextColumn_ReceiverNumber��$
 ReceiverNumber��5H   _   $	 100 6w    6�   �� *ReceiverNumber+$ TwoWay=�$ PropertyChanged=�  5I      -   5        #Output_DataGridTextColumn_Power��$
 Power��5I   V   $	 100 6e    6q   �� *Power+$ TwoWay=�$ PropertyChanged=�  5J      -   5        .*Output_DataGridTextColumn_ReceiverDistance��$
 ReceiverDistance��5J   a   $	 100 6{    6�   �� *ReceiverDistance+$ TwoWay=�$ PropertyChanged=�  5K      -   5        .*Output_DataGridTextColumn_ReceiverLocation��$
 ReceiverLocation��5K   a   $	 100 6{    6�   �� *ReceiverLocation+$ TwoWay=�$ PropertyChanged=�  5L      -   5        .*Output_DataGridTextColumn_ReceiverPathLoss��$
 ReceiverPathLoss��5L   a   $	 100 6{    6�   �� *ReceiverPathLoss+$ TwoWay=�$ PropertyChanged=�.@�5N        -   5        $$��OutputWindow_ReceiverDataGrid1��5N       .   .  5P        5Q      6!     5R      6!     5S      6!     5T      6!     5U      6!     5V      6!     5W      6!   5X      5Y      �� 5Z      $N��HE:\fuqiuhao\C#GUI Test\I-RayTracer\I-RayTracer\bin\x64\Debug\time_pl.jpg��6   $��1��6g   $��2��6w   $��0��6�   �� 5^      $J��DE:\fuqiuhao\C#GUI Test\I-RayTracer\I-RayTracer\bin\x64\Debug\DOA.jpg��6   $��1��6c   $��1��6s   5_      �� 5c      -   5        $	��DOD��5c      $J��DE:\fuqiuhao\C#GUI Test\I-RayTracer\I-RayTracer\bin\x64\Debug\DOD.jpg��6   $��2��6m   $��1��6}   5d      5h      5i      5j      