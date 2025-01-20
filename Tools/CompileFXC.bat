@ECHO OFF

SET "FXC=C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\fxc.exe" 
"%FXC%" Source.hlsl /E MainPS /Zpr /Gec /O3 /T ps_5_0 /Ni /Fc Result.d3dasm

pause
:END
