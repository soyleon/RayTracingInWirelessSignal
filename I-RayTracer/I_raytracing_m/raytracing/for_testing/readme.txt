MATLAB Builder NE (.NET Component)


1. Prerequisites for Deployment 

. Verify the MATLAB runtime is installed and ensure you
  have installed version 8.4 (R2014b).   

. If the MATLAB runtime is not installed, do the following:
  (1) enter
  
      >>mcrinstaller
      
      at MATLAB prompt. The MCRINSTALLER command displays the 
      location of the MATLAB runtime installer.

  (2) run the MATLAB runtime installer.

Or download the Windows 64-bit version of the MATLAB runtime for R2014b 
from the MathWorks Web site by navigating to

   http://www.mathworks.com/products/compiler/mcr/index.html
   

For more information about the MATLAB runtime and the MATLAB runtime installer, see 
Distribution to End Users in the MATLAB Compiler documentation  
in the MathWorks Documentation Center.  
      
NOTE: You will need administrator rights to run MCRInstaller.

2. Files to Deploy and Package

-raytracing.dll
   -contains the generated component using MWArray API. 
-raytracingNative.dll
   -contains the generated component using native API.
-This readme file

. If the target machine does not have the version 8.4 of the MATLAB runtime installed, 
  and the end users are unable to download the MATLAB runtime using the above link, 
  include MCRInstaller.exe.



Auto-generated Documentation Templates:

MWArray.xml - This file contains the code comments for the MWArray data conversion 
              classes and their methods. This file can be found in either the component 
              distrib directory or in
              <mcr_root>*\toolbox\dotnetbuilder\bin\win64\v2.0

raytracing_overview.html - HTML overview documentation file for the generated component. 
                           It contains the requirements for accessing the component and 
                           for generating arguments using the MWArray class hierarchy.

raytracing.xml - This file contains the code comments for the raytracing component 
                           classes and methods. Using a third party documentation tool, 
                           this file can be combined with either or both of the previous 
                           files to generate online documentation for the raytracing 
                           component.

                 


3. Resources

To learn more about:               See:
===================================================================
MWArray classes                    <matlab_root>*\help\toolbox\
                                   dotnetbuilder\MWArrayAPI\
                                   MWArrayAPI.chm  
Examples of .NET Web Applications  Web Deployment in the MATLAB   
                                   Builder NE documentation in the  
                                   MathWorks Documentation Center


4. Definitions

For information on deployment terminology, go to 
http://www.mathworks.com/help. Select MATLAB Compiler >   
Getting Started > About Application Deployment > 
Application Deployment Terms in the MathWorks Documentation 
Center.



* NOTE: <mcr_root> is the directory where the MATLAB runtime is installed on the target 
        machine.
        <matlab_root> is the directory where MATLAB is installed on the target machine.

