rd /s /q C:\Staging\TehnoHolod\
%windir%\Microsoft.NET\Framework\v2.0.50727\aspnet_compiler -p "C:\dev\TehnoHolod\Web" -v / C:\Staging\TehnoHolod -u -fixednames
erase C:\Staging\TehnoHolod\*.bat
erase C:\Staging\TehnoHolod\bin\*.pdb
"%ProgramFiles%\MSBuild\Microsoft\WebDeployment\v8.0\aspnet_merge.exe" C:\Staging\TehnoHolod -a -w TehnoHolodWeb.dll
erase C:\Staging\TehnoHolod\web.config
erase C:\Staging\TehnoHolod\errors.html
rd /s /q C:\Staging\TehnoHolod\i\
rd /s /q C:\Staging\TehnoHolod\fckeditor\
fixenc.exe C:\dev\TehnoHolod\Web\ C:\Staging\TehnoHolod\
