REM == FORCE OVERWRITE ==
REM SET COPYCMD=/Y

SET CMAKE="cmake.exe"
IF EXIST "C:\Program Files\CMake 2.6\bin\cmake.exe" SET CMAKE="C:\Program Files\CMake 2.6\bin\cmake.exe"
IF EXIST "C:\Program Files\CMake 2.8\bin\cmake.exe" SET CMAKE="C:\Program Files\CMake 2.8\bin\cmake.exe"


SET VS2005="C:\Program Files\Microsoft Visual Studio 8\Common7\IDE\devenv.exe"
SET VS2008="C:\Program Files\Microsoft Visual Studio 9.0\Common7\IDE\devenv.exe"
SET MSBUILD35="C:\WINDOWS\Microsoft.NET\Framework\v3.5\MSBuild.exe"

IF EXIST %MSBUILD35% SET DEVENV=%MSBUILD35%
IF EXIST %VS2005% SET DEVENV=%VS2005% 
IF EXIST %VS2008% SET DEVENV=%VS2008%

IF %DEVENV%==%MSBUILD35% SET BUILD_TYPE=/property:Configuration=Release
IF %DEVENV%==%VS2005% SET BUILD_TYPE=/Build Release
IF %DEVENV%==%VS2008% SET BUILD_TYPE=/Build Release

IF %DEVENV%==%MSBUILD35% SET CMAKE_CONF="Visual Studio 8 2005"
IF %DEVENV%==%VS2005% SET CMAKE_CONF="Visual Studio 8 2005"
IF %DEVENV%==%VS2008% SET CMAKE_CONF="Visual Studio 9 2008"

REM %CMAKE% -G %CMAKE_CONF% -DOPENCV_WHOLE_PROGRAM_OPTIMIZATION:BOOL=TRUE -DBUILD_TESTS:BOOL=FALSE . 
%CMAKE% -G %CMAKE_CONF% -DBUILD_TESTS:BOOL=FALSE -DBUILD_NEW_PYTHON_SUPPORT=FALSE .  
%DEVENV% %BUILD_TYPE% emgucv.sln

FOR %%F IN (cxcore200.dll cv200.dll cvaux200.dll cvextern.dll highgui200.dll ml200.dll opencv_ffmpeg200.dll) DO xcopy /D /Y bin\%%F Emgu.CV.Example\WebDynamicImage\Bin 
 
