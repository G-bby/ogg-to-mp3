@echo off

rem replaces all oggs in current and sub directories with mp3 files
rem requires that you have an ffmpeg environment variable (https://youtu.be/DpsJH1keQPA)
rem code modified from https://stackoverflow.com/questions/8397674/windows-batch-file-looping-through-directories-to-process-files

call :treeProcess
goto :eof

:treeProcess
for %%f in (*.ogg) do ffmpeg -i %%f %%f.mp3 && del %%f
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
exit /b
