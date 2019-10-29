/*
* MATLAB Compiler: 5.2 (R2014b)
* Date: Thu Jun 22 21:47:09 2017
* Arguments: "-B" "macro_default" "-W" "dotnet:raytracing,raytracingClass,0.0,private"
* "-T" "link:lib" "-d" "E:\fuqiuhao\I_raytracing_m\raytracing\for_testing" "-v"
* "class{raytracingClass:E:\fuqiuhao\I_raytracing_m\intersectmianjuxing0.m,E:\fuqiuhao\I_r
* aytracing_m\intersectmianjuxing1.m,E:\fuqiuhao\I_raytracing_m\intersectmianjuxing2.m,E:\
* fuqiuhao\I_raytracing_m\intersectmianjuxing3.m,E:\fuqiuhao\I_raytracing_m\intersectmianj
* uxing4.m,E:\fuqiuhao\I_raytracing_m\judge1.m,E:\fuqiuhao\I_raytracing_m\raytracing.m,E:\
* fuqiuhao\I_raytracing_m\receive1.m,E:\fuqiuhao\I_raytracing_m\receivezhida.m,E:\fuqiuhao
* \I_raytracing_m\reflectdirectionjx.m}" 
*/
using System;
using System.Reflection;
using System.IO;
using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;

#if SHARED
[assembly: System.Reflection.AssemblyKeyFile(@"")]
#endif

namespace raytracing
{

  /// <summary>
  /// The raytracingClass class provides a CLS compliant, MWArray interface to the MATLAB
  /// functions contained in the files:
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\intersectmianjuxing0.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\intersectmianjuxing1.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\intersectmianjuxing2.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\intersectmianjuxing3.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\intersectmianjuxing4.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\judge1.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\raytracing.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\receive1.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\receivezhida.m
  /// <newpara></newpara>
  /// E:\fuqiuhao\I_raytracing_m\reflectdirectionjx.m
  /// </summary>
  /// <remarks>
  /// @Version 0.0
  /// </remarks>
  public class raytracingClass : IDisposable
  {
    #region Constructors

    /// <summary internal= "true">
    /// The static constructor instantiates and initializes the MATLAB Compiler Runtime
    /// instance.
    /// </summary>
    static raytracingClass()
    {
      if (MWMCR.MCRAppInitialized)
      {
        try
        {
          Assembly assembly= Assembly.GetExecutingAssembly();

          string ctfFilePath= assembly.Location;

          int lastDelimiter= ctfFilePath.LastIndexOf(@"\");

          ctfFilePath= ctfFilePath.Remove(lastDelimiter, (ctfFilePath.Length - lastDelimiter));

          string ctfFileName = "raytracing.ctf";

          Stream embeddedCtfStream = null;

          String[] resourceStrings = assembly.GetManifestResourceNames();

          foreach (String name in resourceStrings)
          {
            if (name.Contains(ctfFileName))
            {
              embeddedCtfStream = assembly.GetManifestResourceStream(name);
              break;
            }
          }
          mcr= new MWMCR("",
                         ctfFilePath, embeddedCtfStream, true);
        }
        catch(Exception ex)
        {
          ex_ = new Exception("MWArray assembly failed to be initialized", ex);
        }
      }
      else
      {
        ex_ = new ApplicationException("MWArray assembly could not be initialized");
      }
    }


    /// <summary>
    /// Constructs a new instance of the raytracingClass class.
    /// </summary>
    public raytracingClass()
    {
      if(ex_ != null)
      {
        throw ex_;
      }
    }


    #endregion Constructors

    #region Finalize

    /// <summary internal= "true">
    /// Class destructor called by the CLR garbage collector.
    /// </summary>
    ~raytracingClass()
    {
      Dispose(false);
    }


    /// <summary>
    /// Frees the native resources associated with this object
    /// </summary>
    public void Dispose()
    {
      Dispose(true);

      GC.SuppressFinalize(this);
    }


    /// <summary internal= "true">
    /// Internal dispose function
    /// </summary>
    protected virtual void Dispose(bool disposing)
    {
      if (!disposed)
      {
        disposed= true;

        if (disposing)
        {
          // Free managed resources;
        }

        // Free native resources
      }
    }


    #endregion Finalize

    #region Methods

    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0()
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3, MWArray h)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3, h);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray l)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3, h, l);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray l, MWArray n)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3, h, l, n);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray l, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3, h, l, n, tx);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray l, MWArray n, MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3, h, l, n, tx, ty);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <param name="tz">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing0(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray l, MWArray n, MWArray tx, MWArray ty, MWArray 
                                  tz)
    {
      return mcr.EvaluateFunction("intersectmianjuxing0", v1, v2, v3, h, l, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3, h);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray l)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3, h, l);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray l, MWArray n)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3, h, l, n);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray l, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3, h, l, n, tx);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray l, MWArray n, MWArray tx, 
                                    MWArray ty)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3, h, l, n, tx, ty);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the intersectmianjuxing0
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="l">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <param name="tz">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing0(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray l, MWArray n, MWArray tx, 
                                    MWArray ty, MWArray tz)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing0", v1, v2, v3, h, l, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides an interface for the intersectmianjuxing0 function in which the input
    /// and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 与近轴截面求交的函数：将判决后可能与近轴截面相交的射线与对应面求交，并判断交点是否
    /// 在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void intersectmianjuxing0(int numArgsOut, ref MWArray[] argsOut, MWArray[] 
                           argsIn)
    {
      mcr.EvaluateFunction("intersectmianjuxing0", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1()
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3, MWArray w)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3, w);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3, MWArray w, 
                                  MWArray n)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3, w, n);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3, MWArray w, 
                                  MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3, w, n, tx);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3, MWArray w, 
                                  MWArray n, MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3, w, n, tx, ty);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3, MWArray w, 
                                  MWArray n, MWArray tx, MWArray ty, MWArray tz)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3, w, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <param name="length">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing1(MWArray v1, MWArray v2, MWArray v3, MWArray w, 
                                  MWArray n, MWArray tx, MWArray ty, MWArray tz, MWArray 
                                  length)
    {
      return mcr.EvaluateFunction("intersectmianjuxing1", v1, v2, v3, w, n, tx, ty, tz, length);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray w)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3, w);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray w, MWArray n)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3, w, n);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray w, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3, w, n, tx);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray w, MWArray n, MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3, w, n, tx, ty);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray w, MWArray n, MWArray tx, MWArray ty, 
                                    MWArray tz)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3, w, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the intersectmianjuxing1
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="w">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <param name="length">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing1(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray w, MWArray n, MWArray tx, MWArray ty, 
                                    MWArray tz, MWArray length)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing1", v1, v2, v3, w, n, tx, ty, tz, length);
    }


    /// <summary>
    /// Provides an interface for the intersectmianjuxing1 function in which the input
    /// and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 与封闭矩形面室内上下面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并
    /// 判断交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void intersectmianjuxing1(int numArgsOut, ref MWArray[] argsOut, MWArray[] 
                           argsIn)
    {
      mcr.EvaluateFunction("intersectmianjuxing1", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2()
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3, MWArray h)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3, h);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray n)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3, h, n);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3, h, n, tx);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray n, MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3, h, n, tx, ty);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray n, MWArray tx, MWArray ty, MWArray tz)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3, h, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <param name="w">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing2(MWArray v1, MWArray v2, MWArray v3, MWArray h, 
                                  MWArray n, MWArray tx, MWArray ty, MWArray tz, MWArray 
                                  w)
    {
      return mcr.EvaluateFunction("intersectmianjuxing2", v1, v2, v3, h, n, tx, ty, tz, w);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3, h);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray n)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3, h, n);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3, h, n, tx);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray n, MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3, h, n, tx, ty);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray n, MWArray tx, MWArray ty, 
                                    MWArray tz)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3, h, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the intersectmianjuxing2
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="n">Input argument #5</param>
    /// <param name="tx">Input argument #6</param>
    /// <param name="ty">Input argument #7</param>
    /// <param name="tz">Input argument #8</param>
    /// <param name="w">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing2(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray h, MWArray n, MWArray tx, MWArray ty, 
                                    MWArray tz, MWArray w)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing2", v1, v2, v3, h, n, tx, ty, tz, w);
    }


    /// <summary>
    /// Provides an interface for the intersectmianjuxing2 function in which the input
    /// and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 与矩形室内左右墙面求交的函数：将判决后可能与这两个面相交的射线与对应面求交，并判断
    /// 交点是否在矩形室实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void intersectmianjuxing2(int numArgsOut, ref MWArray[] argsOut, MWArray[] 
                           argsIn)
    {
      mcr.EvaluateFunction("intersectmianjuxing2", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3()
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp, 
                                  MWArray wp)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp, wp);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp, 
                                  MWArray wp, MWArray l)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp, wp, l);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp, 
                                  MWArray wp, MWArray l, MWArray n)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp, wp, l, n);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <param name="tx">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp, 
                                  MWArray wp, MWArray l, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp, wp, l, n, tx);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <param name="tx">Input argument #8</param>
    /// <param name="ty">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp, 
                                  MWArray wp, MWArray l, MWArray n, MWArray tx, MWArray 
                                  ty)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp, wp, l, n, tx, ty);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <param name="tx">Input argument #8</param>
    /// <param name="ty">Input argument #9</param>
    /// <param name="tz">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing3(MWArray v1, MWArray v2, MWArray v3, MWArray hp, 
                                  MWArray wp, MWArray l, MWArray n, MWArray tx, MWArray 
                                  ty, MWArray tz)
    {
      return mcr.EvaluateFunction("intersectmianjuxing3", v1, v2, v3, hp, wp, l, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp, MWArray wp)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp, wp);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp, MWArray wp, MWArray l)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp, wp, l);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp, MWArray wp, MWArray l, MWArray n)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp, wp, l, n);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <param name="tx">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp, MWArray wp, MWArray l, MWArray n, 
                                    MWArray tx)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp, wp, l, n, tx);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <param name="tx">Input argument #8</param>
    /// <param name="ty">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp, MWArray wp, MWArray l, MWArray n, 
                                    MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp, wp, l, n, tx, ty);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the intersectmianjuxing3
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="hp">Input argument #4</param>
    /// <param name="wp">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="n">Input argument #7</param>
    /// <param name="tx">Input argument #8</param>
    /// <param name="ty">Input argument #9</param>
    /// <param name="tz">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing3(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray hp, MWArray wp, MWArray l, MWArray n, 
                                    MWArray tx, MWArray ty, MWArray tz)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing3", v1, v2, v3, hp, wp, l, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides an interface for the intersectmianjuxing3 function in which the input
    /// and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 与讲台前面面求交的函数：将判决后可能与讲台前面相交的射线与对应面求交，并判断交点是
    /// 否在近轴截面实际范围内
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void intersectmianjuxing3(int numArgsOut, ref MWArray[] argsOut, MWArray[] 
                           argsIn)
    {
      mcr.EvaluateFunction("intersectmianjuxing3", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4()
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp, 
                                  MWArray hp)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp, hp);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp, 
                                  MWArray hp, MWArray n)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp, hp, n);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp, 
                                  MWArray hp, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp, 
                                  MWArray hp, MWArray n, MWArray tx, MWArray ty)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx, ty);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <param name="tz">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp, 
                                  MWArray hp, MWArray n, MWArray tx, MWArray ty, MWArray 
                                  tz)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <param name="tz">Input argument #9</param>
    /// <param name="length">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray intersectmianjuxing4(MWArray v1, MWArray v2, MWArray v3, MWArray wp, 
                                  MWArray hp, MWArray n, MWArray tx, MWArray ty, MWArray 
                                  tz, MWArray length)
    {
      return mcr.EvaluateFunction("intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx, ty, tz, length);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp, MWArray hp)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp, hp);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp, MWArray hp, MWArray n)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp, hp, n);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp, MWArray hp, MWArray n, MWArray tx)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp, MWArray hp, MWArray n, MWArray tx, 
                                    MWArray ty)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx, ty);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <param name="tz">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp, MWArray hp, MWArray n, MWArray tx, 
                                    MWArray ty, MWArray tz)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx, ty, tz);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the intersectmianjuxing4
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="wp">Input argument #4</param>
    /// <param name="hp">Input argument #5</param>
    /// <param name="n">Input argument #6</param>
    /// <param name="tx">Input argument #7</param>
    /// <param name="ty">Input argument #8</param>
    /// <param name="tz">Input argument #9</param>
    /// <param name="length">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] intersectmianjuxing4(int numArgsOut, MWArray v1, MWArray v2, MWArray 
                                    v3, MWArray wp, MWArray hp, MWArray n, MWArray tx, 
                                    MWArray ty, MWArray tz, MWArray length)
    {
      return mcr.EvaluateFunction(numArgsOut, "intersectmianjuxing4", v1, v2, v3, wp, hp, n, tx, ty, tz, length);
    }


    /// <summary>
    /// Provides an interface for the intersectmianjuxing4 function in which the input
    /// and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 与讲台上方交的函数：将判决后可能与这两个面相交的射线与对应面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void intersectmianjuxing4(int numArgsOut, ref MWArray[] argsOut, MWArray[] 
                           argsIn)
    {
      mcr.EvaluateFunction("intersectmianjuxing4", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1()
    {
      return mcr.EvaluateFunction("judge1", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1)
    {
      return mcr.EvaluateFunction("judge1", t1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2)
    {
      return mcr.EvaluateFunction("judge1", t1, t2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w, 
                    MWArray l)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w, l);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w, 
                    MWArray l, MWArray hp)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w, l, hp);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w, 
                    MWArray l, MWArray hp, MWArray wp)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w, l, hp, wp);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <param name="vx">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w, 
                    MWArray l, MWArray hp, MWArray wp, MWArray vx)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w, l, hp, wp, vx);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the judge1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <param name="vx">Input argument #9</param>
    /// <param name="vy">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w, 
                    MWArray l, MWArray hp, MWArray wp, MWArray vx, MWArray vy)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w, l, hp, wp, vx, vy);
    }


    /// <summary>
    /// Provides a single output, 11-input MWArrayinterface to the judge1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <param name="vx">Input argument #9</param>
    /// <param name="vy">Input argument #10</param>
    /// <param name="vz">Input argument #11</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray judge1(MWArray t1, MWArray t2, MWArray t3, MWArray h, MWArray w, 
                    MWArray l, MWArray hp, MWArray wp, MWArray vx, MWArray vy, MWArray vz)
    {
      return mcr.EvaluateFunction("judge1", t1, t2, t3, h, w, l, hp, wp, vx, vy, vz);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray h)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w, MWArray l)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w, l);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w, MWArray l, MWArray hp)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w, l, hp);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w, MWArray l, MWArray hp, MWArray wp)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w, l, hp, wp);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <param name="vx">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w, MWArray l, MWArray hp, MWArray wp, MWArray vx)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w, l, hp, wp, vx);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <param name="vx">Input argument #9</param>
    /// <param name="vy">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w, MWArray l, MWArray hp, MWArray wp, MWArray vx, 
                      MWArray vy)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w, l, hp, wp, vx, vy);
    }


    /// <summary>
    /// Provides the standard 11-input MWArray interface to the judge1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="h">Input argument #4</param>
    /// <param name="w">Input argument #5</param>
    /// <param name="l">Input argument #6</param>
    /// <param name="hp">Input argument #7</param>
    /// <param name="wp">Input argument #8</param>
    /// <param name="vx">Input argument #9</param>
    /// <param name="vy">Input argument #10</param>
    /// <param name="vz">Input argument #11</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] judge1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                      h, MWArray w, MWArray l, MWArray hp, MWArray wp, MWArray vx, 
                      MWArray vy, MWArray vz)
    {
      return mcr.EvaluateFunction(numArgsOut, "judge1", t1, t2, t3, h, w, l, hp, wp, vx, vy, vz);
    }


    /// <summary>
    /// Provides an interface for the judge1 function in which the input and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 交点位置判决函数：考虑射线打到接收点之前的场景，判断射线与接收点之前的各面求交
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void judge1(int numArgsOut, ref MWArray[] argsOut, MWArray[] argsIn)
    {
      mcr.EvaluateFunction("judge1", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing()
    {
      return mcr.EvaluateFunction("raytracing", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face)
    {
      return mcr.EvaluateFunction("raytracing", face);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity, MWArray face_conductivity)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity, MWArray face_conductivity, MWArray 
                        transmitter_number)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity, MWArray face_conductivity, MWArray 
                        transmitter_number, MWArray receiver_num)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <param name="transmitter_location">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity, MWArray face_conductivity, MWArray 
                        transmitter_number, MWArray receiver_num, MWArray 
                        transmitter_location)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num, transmitter_location);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <param name="transmitter_location">Input argument #8</param>
    /// <param name="receiver_location">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity, MWArray face_conductivity, MWArray 
                        transmitter_number, MWArray receiver_num, MWArray 
                        transmitter_location, MWArray receiver_location)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num, transmitter_location, receiver_location);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <param name="transmitter_location">Input argument #8</param>
    /// <param name="receiver_location">Input argument #9</param>
    /// <param name="antenna_gain">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray raytracing(MWArray face, MWArray power_transmitter, MWArray frequency, 
                        MWArray face_permitivity, MWArray face_conductivity, MWArray 
                        transmitter_number, MWArray receiver_num, MWArray 
                        transmitter_location, MWArray receiver_location, MWArray 
                        antenna_gain)
    {
      return mcr.EvaluateFunction("raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num, transmitter_location, receiver_location, antenna_gain);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity, MWArray 
                          face_conductivity)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity, MWArray 
                          face_conductivity, MWArray transmitter_number)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity, MWArray 
                          face_conductivity, MWArray transmitter_number, MWArray 
                          receiver_num)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <param name="transmitter_location">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity, MWArray 
                          face_conductivity, MWArray transmitter_number, MWArray 
                          receiver_num, MWArray transmitter_location)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num, transmitter_location);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <param name="transmitter_location">Input argument #8</param>
    /// <param name="receiver_location">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity, MWArray 
                          face_conductivity, MWArray transmitter_number, MWArray 
                          receiver_num, MWArray transmitter_location, MWArray 
                          receiver_location)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num, transmitter_location, receiver_location);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the raytracing MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="face">Input argument #1</param>
    /// <param name="power_transmitter">Input argument #2</param>
    /// <param name="frequency">Input argument #3</param>
    /// <param name="face_permitivity">Input argument #4</param>
    /// <param name="face_conductivity">Input argument #5</param>
    /// <param name="transmitter_number">Input argument #6</param>
    /// <param name="receiver_num">Input argument #7</param>
    /// <param name="transmitter_location">Input argument #8</param>
    /// <param name="receiver_location">Input argument #9</param>
    /// <param name="antenna_gain">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] raytracing(int numArgsOut, MWArray face, MWArray power_transmitter, 
                          MWArray frequency, MWArray face_permitivity, MWArray 
                          face_conductivity, MWArray transmitter_number, MWArray 
                          receiver_num, MWArray transmitter_location, MWArray 
                          receiver_location, MWArray antenna_gain)
    {
      return mcr.EvaluateFunction(numArgsOut, "raytracing", face, power_transmitter, frequency, face_permitivity, face_conductivity, transmitter_number, receiver_num, transmitter_location, receiver_location, antenna_gain);
    }


    /// <summary>
    /// Provides an interface for the raytracing function in which the input and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 有损耗介质的复相对介电常数计算公式
    /// 混凝土的相对介电常数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void raytracing(int numArgsOut, ref MWArray[] argsOut, MWArray[] argsIn)
    {
      mcr.EvaluateFunction("raytracing", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1()
    {
      return mcr.EvaluateFunction("receive1", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1)
    {
      return mcr.EvaluateFunction("receive1", t1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2)
    {
      return mcr.EvaluateFunction("receive1", t1, t2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz, MWArray newray)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz, newray);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz, MWArray newray, MWArray a)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz, newray, a);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz, MWArray newray, MWArray a, MWArray l)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz, newray, a, l);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <param name="pathlength">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz, MWArray newray, MWArray a, MWArray l, MWArray 
                      pathlength)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz, newray, a, l, pathlength);
    }


    /// <summary>
    /// Provides a single output, 11-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <param name="pathlength">Input argument #10</param>
    /// <param name="rcoe">Input argument #11</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz, MWArray newray, MWArray a, MWArray l, MWArray 
                      pathlength, MWArray rcoe)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz, newray, a, l, pathlength, rcoe);
    }


    /// <summary>
    /// Provides a single output, 12-input MWArrayinterface to the receive1 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <param name="pathlength">Input argument #10</param>
    /// <param name="rcoe">Input argument #11</param>
    /// <param name="GainT">Input argument #12</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receive1(MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                      MWArray rz, MWArray newray, MWArray a, MWArray l, MWArray 
                      pathlength, MWArray rcoe, MWArray GainT)
    {
      return mcr.EvaluateFunction("receive1", t1, t2, t3, rx, ry, rz, newray, a, l, pathlength, rcoe, GainT);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz, MWArray newray)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz, newray);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz, MWArray newray, MWArray a)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz, newray, a);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz, MWArray newray, MWArray a, MWArray l)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz, newray, a, l);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <param name="pathlength">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz, MWArray newray, MWArray a, MWArray l, 
                        MWArray pathlength)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz, newray, a, l, pathlength);
    }


    /// <summary>
    /// Provides the standard 11-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <param name="pathlength">Input argument #10</param>
    /// <param name="rcoe">Input argument #11</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz, MWArray newray, MWArray a, MWArray l, 
                        MWArray pathlength, MWArray rcoe)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz, newray, a, l, pathlength, rcoe);
    }


    /// <summary>
    /// Provides the standard 12-input MWArray interface to the receive1 MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="t1">Input argument #1</param>
    /// <param name="t2">Input argument #2</param>
    /// <param name="t3">Input argument #3</param>
    /// <param name="rx">Input argument #4</param>
    /// <param name="ry">Input argument #5</param>
    /// <param name="rz">Input argument #6</param>
    /// <param name="newray">Input argument #7</param>
    /// <param name="a">Input argument #8</param>
    /// <param name="l">Input argument #9</param>
    /// <param name="pathlength">Input argument #10</param>
    /// <param name="rcoe">Input argument #11</param>
    /// <param name="GainT">Input argument #12</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receive1(int numArgsOut, MWArray t1, MWArray t2, MWArray t3, MWArray 
                        rx, MWArray ry, MWArray rz, MWArray newray, MWArray a, MWArray l, 
                        MWArray pathlength, MWArray rcoe, MWArray GainT)
    {
      return mcr.EvaluateFunction(numArgsOut, "receive1", t1, t2, t3, rx, ry, rz, newray, a, l, pathlength, rcoe, GainT);
    }


    /// <summary>
    /// Provides an interface for the receive1 function in which the input and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 多次反射射线的接收判决及场强计算
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void receive1(int numArgsOut, ref MWArray[] argsOut, MWArray[] argsIn)
    {
      mcr.EvaluateFunction("receive1", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida()
    {
      return mcr.EvaluateFunction("receivezhida", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1)
    {
      return mcr.EvaluateFunction("receivezhida", v1);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3, MWArray rx)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3, rx);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3, MWArray rx, MWArray ry)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3, rx, ry);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3, MWArray rx, MWArray ry, MWArray rz)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <param name="a">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3, MWArray rx, MWArray ry, MWArray rz, MWArray a)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz, a);
    }


    /// <summary>
    /// Provides a single output, 11-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <param name="a">Input argument #10</param>
    /// <param name="l">Input argument #11</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3, MWArray rx, MWArray ry, MWArray rz, MWArray a, 
                          MWArray l)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz, a, l);
    }


    /// <summary>
    /// Provides a single output, 12-input MWArrayinterface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <param name="a">Input argument #10</param>
    /// <param name="l">Input argument #11</param>
    /// <param name="GainT">Input argument #12</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray receivezhida(MWArray v1, MWArray v2, MWArray v3, MWArray t1, MWArray 
                          t2, MWArray t3, MWArray rx, MWArray ry, MWArray rz, MWArray a, 
                          MWArray l, MWArray GainT)
    {
      return mcr.EvaluateFunction("receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz, a, l, GainT);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3, MWArray rx)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3, rx);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3, rx, ry);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                            MWArray rz)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <param name="a">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                            MWArray rz, MWArray a)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz, a);
    }


    /// <summary>
    /// Provides the standard 11-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <param name="a">Input argument #10</param>
    /// <param name="l">Input argument #11</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                            MWArray rz, MWArray a, MWArray l)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz, a, l);
    }


    /// <summary>
    /// Provides the standard 12-input MWArray interface to the receivezhida MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="v1">Input argument #1</param>
    /// <param name="v2">Input argument #2</param>
    /// <param name="v3">Input argument #3</param>
    /// <param name="t1">Input argument #4</param>
    /// <param name="t2">Input argument #5</param>
    /// <param name="t3">Input argument #6</param>
    /// <param name="rx">Input argument #7</param>
    /// <param name="ry">Input argument #8</param>
    /// <param name="rz">Input argument #9</param>
    /// <param name="a">Input argument #10</param>
    /// <param name="l">Input argument #11</param>
    /// <param name="GainT">Input argument #12</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] receivezhida(int numArgsOut, MWArray v1, MWArray v2, MWArray v3, 
                            MWArray t1, MWArray t2, MWArray t3, MWArray rx, MWArray ry, 
                            MWArray rz, MWArray a, MWArray l, MWArray GainT)
    {
      return mcr.EvaluateFunction(numArgsOut, "receivezhida", v1, v2, v3, t1, t2, t3, rx, ry, rz, a, l, GainT);
    }


    /// <summary>
    /// Provides an interface for the receivezhida function in which the input and output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// pr(1,3)=180-acosd(d1/dtr);  到达角
    /// pr(1,4)=0;  反射次数，即直达
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void receivezhida(int numArgsOut, ref MWArray[] argsOut, MWArray[] argsIn)
    {
      mcr.EvaluateFunction("receivezhida", numArgsOut, ref argsOut, argsIn);
    }


    /// <summary>
    /// Provides a single output, 0-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx()
    {
      return mcr.EvaluateFunction("reflectdirectionjx", new MWArray[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp);
    }


    /// <summary>
    /// Provides a single output, 2-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1);
    }


    /// <summary>
    /// Provides a single output, 3-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2);
    }


    /// <summary>
    /// Provides a single output, 4-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3);
    }


    /// <summary>
    /// Provides a single output, 5-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0);
    }


    /// <summary>
    /// Provides a single output, 6-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1);
    }


    /// <summary>
    /// Provides a single output, 7-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2);
    }


    /// <summary>
    /// Provides a single output, 8-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3);
    }


    /// <summary>
    /// Provides a single output, 9-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4);
    }


    /// <summary>
    /// Provides a single output, 10-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5);
    }


    /// <summary>
    /// Provides a single output, 11-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5, MWArray e0)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0);
    }


    /// <summary>
    /// Provides a single output, 12-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5, MWArray e0, MWArray e1)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1);
    }


    /// <summary>
    /// Provides a single output, 13-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5, MWArray e0, MWArray e1, MWArray e2)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2);
    }


    /// <summary>
    /// Provides a single output, 14-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <param name="e3">Input argument #14</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5, MWArray e0, MWArray e1, MWArray e2, 
                                MWArray e3)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2, e3);
    }


    /// <summary>
    /// Provides a single output, 15-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <param name="e3">Input argument #14</param>
    /// <param name="e4">Input argument #15</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5, MWArray e0, MWArray e1, MWArray e2, 
                                MWArray e3, MWArray e4)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2, e3, e4);
    }


    /// <summary>
    /// Provides a single output, 16-input MWArrayinterface to the reflectdirectionjx
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <param name="e3">Input argument #14</param>
    /// <param name="e4">Input argument #15</param>
    /// <param name="e5">Input argument #16</param>
    /// <returns>An MWArray containing the first output argument.</returns>
    ///
    public MWArray reflectdirectionjx(MWArray rp, MWArray v1, MWArray v2, MWArray v3, 
                                MWArray n0, MWArray n1, MWArray n2, MWArray n3, MWArray 
                                n4, MWArray n5, MWArray e0, MWArray e1, MWArray e2, 
                                MWArray e3, MWArray e4, MWArray e5)
    {
      return mcr.EvaluateFunction("reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2, e3, e4, e5);
    }


    /// <summary>
    /// Provides the standard 0-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", new MWArray[]{});
    }


    /// <summary>
    /// Provides the standard 1-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp);
    }


    /// <summary>
    /// Provides the standard 2-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1);
    }


    /// <summary>
    /// Provides the standard 3-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2);
    }


    /// <summary>
    /// Provides the standard 4-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3);
    }


    /// <summary>
    /// Provides the standard 5-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0);
    }


    /// <summary>
    /// Provides the standard 6-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1);
    }


    /// <summary>
    /// Provides the standard 7-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2);
    }


    /// <summary>
    /// Provides the standard 8-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3);
    }


    /// <summary>
    /// Provides the standard 9-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4);
    }


    /// <summary>
    /// Provides the standard 10-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5);
    }


    /// <summary>
    /// Provides the standard 11-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5, MWArray e0)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0);
    }


    /// <summary>
    /// Provides the standard 12-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5, MWArray e0, MWArray 
                                  e1)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1);
    }


    /// <summary>
    /// Provides the standard 13-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5, MWArray e0, MWArray 
                                  e1, MWArray e2)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2);
    }


    /// <summary>
    /// Provides the standard 14-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <param name="e3">Input argument #14</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5, MWArray e0, MWArray 
                                  e1, MWArray e2, MWArray e3)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2, e3);
    }


    /// <summary>
    /// Provides the standard 15-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <param name="e3">Input argument #14</param>
    /// <param name="e4">Input argument #15</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5, MWArray e0, MWArray 
                                  e1, MWArray e2, MWArray e3, MWArray e4)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2, e3, e4);
    }


    /// <summary>
    /// Provides the standard 16-input MWArray interface to the reflectdirectionjx MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="rp">Input argument #1</param>
    /// <param name="v1">Input argument #2</param>
    /// <param name="v2">Input argument #3</param>
    /// <param name="v3">Input argument #4</param>
    /// <param name="n0">Input argument #5</param>
    /// <param name="n1">Input argument #6</param>
    /// <param name="n2">Input argument #7</param>
    /// <param name="n3">Input argument #8</param>
    /// <param name="n4">Input argument #9</param>
    /// <param name="n5">Input argument #10</param>
    /// <param name="e0">Input argument #11</param>
    /// <param name="e1">Input argument #12</param>
    /// <param name="e2">Input argument #13</param>
    /// <param name="e3">Input argument #14</param>
    /// <param name="e4">Input argument #15</param>
    /// <param name="e5">Input argument #16</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public MWArray[] reflectdirectionjx(int numArgsOut, MWArray rp, MWArray v1, MWArray 
                                  v2, MWArray v3, MWArray n0, MWArray n1, MWArray n2, 
                                  MWArray n3, MWArray n4, MWArray n5, MWArray e0, MWArray 
                                  e1, MWArray e2, MWArray e3, MWArray e4, MWArray e5)
    {
      return mcr.EvaluateFunction(numArgsOut, "reflectdirectionjx", rp, v1, v2, v3, n0, n1, n2, n3, n4, n5, e0, e1, e2, e3, e4, e5);
    }


    /// <summary>
    /// Provides an interface for the reflectdirectionjx function in which the input and
    /// output
    /// arguments are specified as an array of MWArrays.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// 确定矩形室内射线反射方向的函数：由交点位置确定射线的反射方向，并记录反射点的反射系
    /// 数
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of MWArray output arguments</param>
    /// <param name= "argsIn">Array of MWArray input arguments</param>
    ///
    public void reflectdirectionjx(int numArgsOut, ref MWArray[] argsOut, MWArray[] 
                         argsIn)
    {
      mcr.EvaluateFunction("reflectdirectionjx", numArgsOut, ref argsOut, argsIn);
    }



    /// <summary>
    /// This method will cause a MATLAB figure window to behave as a modal dialog box.
    /// The method will not return until all the figure windows associated with this
    /// component have been closed.
    /// </summary>
    /// <remarks>
    /// An application should only call this method when required to keep the
    /// MATLAB figure window from disappearing.  Other techniques, such as calling
    /// Console.ReadLine() from the application should be considered where
    /// possible.</remarks>
    ///
    public void WaitForFiguresToDie()
    {
      mcr.WaitForFiguresToDie();
    }



    #endregion Methods

    #region Class Members

    private static MWMCR mcr= null;

    private static Exception ex_= null;

    private bool disposed= false;

    #endregion Class Members
  }
}
