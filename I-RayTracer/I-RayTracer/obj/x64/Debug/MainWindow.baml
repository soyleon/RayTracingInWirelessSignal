   M S B A M L   `   `   `  ����  I-RayTracer    I_RayTracer.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6F   -   5          �Name$  I_RayTracer_MainWindow��5   �    � Title$ I-RayTracer��5   	   $	��400��6   $	��600��6*    � 
ResizeMode$ CanResizeWithGrip=�66   .��5      � .+�5   
   o� -   5         o�Name$ I_RayTracer_Menu��5      $	��Top=�6)   $��20��6A   .@�5      m� -   5         m�Name$ MainWindow_Menu_File��5      $
��File��65   .@�5	      m� -   5        $ MainWindow_Menu_File_Open��5	      $
��Open��6>   m� 5
      -   5        $ MainWindow_Menu_File_Save��5
      $
��Save��6>   m� 5      -   5        $ MainWindow_Menu_File_New��5      $	��New��6=   m� 5      -   5        $ MainWindow_Menu_File_Exit��5      $
��Exit��6>   5      m� 5      -   5        $ MainWindow_Menu_Edit��5      $
��Edit��65   5      m� 5      -	   5        $ MainWindow_Menu_View��5      $
��View��65   5      m� 5      -
   5        $ MainWindow_Menu_Project��5      $��Project��68   5      m� 5      -   5        $ MainWindow_Menu_Window��5      $��Window��67   5      m� 5      -   5        $ MainWindow_Menu_Help��5      $
��Help��65   5      5      � 5   
   -   5         �Name$" I_RayTracing_MainWindow_Grid��5      $��0,20,0,0q�65    � ColumnDefinitions 5      �� 5      �� 5      �� 5       � RowDefinitions 5       �� 5!      �� 5"      �� 5#      .+�5%      �� -   5         ��Name$ Button_Tunnel_Interface��5%      $��0��66   $��1��6F   $��Stretch=�6S   $��Stretch=�6x   ��5&      �� 5'      .+�5(      �� -   5        	 ��Name$	 Tunnel_Button_Label��5(   $   $��Center=�6A   $��Tunnel��6^   $
��Bold"�6l   6�   �� 5)      -   5        
 ��Name$
 Tunnel_Button_Image��5)       $��/GUIpicture/tunnel.jpg��6=    J� RenderTransformOrigin$	 0,0&�6]   $��0,0,0,20q�6y   6�   5*      5,      �� 5-      -   5        $ Button_Indoor_Interface��5-      $��1��66   $��1��6F   $��Stretch=�6S   $��Stretch=�6x   $
��Bold"�6�   ��5.      �� 5/      .+�50      �� -   5        $	 Indoor_Button_Label��50   $   $��Center=�6A   $��Indoor��6^   6n   �� 51      -   5        $
 Indoor_Button_Image��51       $��/GUIpicture/indoor.jpg��6=   $ 0.529,0.625&�6]   $��0,0,0,20q�6�   52      54      �� 55      -   5        $ Button_Urban_Interface��55      $��2��65   $��1��6F   $��Stretch=�6S   $��Stretch=�6x   ��56      �� 57      .+�58      �� -   5        $	 Urban_Button_Label��58   $   $��Center=�6@   $��Urban��6]   $
��Bold"�6j   59      �� 5:      -   5        $
 Urban_Button_Image��5:       $��/GUIpicture/urban.jpg��6=   $	 0,0&�6\   $��0,0,0,20q�6x   6�   5;      5=      �� 5>      -   5        $ Button_Hybrid_Interface��5>      $��0��66   $��2��6G   $��Stretch=�6T   $��Stretch=�6y   ��5?      �� 5@      .+�5A      �� -   5        $	 Hybird_Button_Label��5A   $   $��Center=�6A   $��Hybird��6^   $
��Bold"�6l   6�   �� 5B      -   5        $
 Hybird_Button_Image��5B       $��/GUIpicture/hybrid.jpg��6=   $	 0,0&�6]   $��0,0,0,20q�6y   6�   5C      5E      �� 5F      -   5        $ Button_Rural_Interface��5F      $��1��65   $��2��6E   $��Stretch=�6R   $��Stretch=�6w   ��5G      �� 5H      .+�5I      �� -   5        $	 Rural_Button_Label��5I   $   $��Center=�6@   $��Rural��6]   $
��Bold"�6j   6~   �� 5J      -   5        $
 Rural_Button_Image��5J       $��/GUIpicture/rural.jpg��6<   $	 0,0&�6[   $��0,0,0,20q�6w   6�   5K      5M      �� 5N      -   5        $  Button_Vehicular_Interface��5N      $��2��69   $��2��6I   $��Stretch=�6V   $��Stretch=�6{   ��5O      �� 5P      .+�5Q      �� -   5        $	 Vehicular_Button_Label��5Q   $   $��Center=�6D   $��	Vehicular��6a   $
��Bold"�6r   6�   �� 5R      -   5        $
 Vehicular_Button_Image��5R       $��/GUIpicture/vehicular.jpg��6A   $	 0,0&�6d   $��0,0,0,20q�6�   6�   5S      5U      �� 5V      -    5         ��Name$ Backgroud_Rectangle��5V      $��0��65   $��3��6C   
���  ����5W      �� 5X       �� EndPoint$ 0.5,1&�6*    �� 
StartPoint$ 0.5,0&�6;   .��5Y      �  � Color# � ��6'    � Offset$ 0Q�6k   � 5Z      $ White��6'   $ 1Q�65   5[      5]      (� 5^      $��Center=�6   $��Center=�61   $��0��6N   $��3��6\   .��5_      �� -!   5         ��Name$ Backgroud_Label��5_      $��Welcome to I-RayTracer��61   $��Center=�6R   $��Center=�6o   5`      5a      5b      5c      