@ECHO off

git submodule update --init
mkdir artifacts\win32-x86-64
cd sqlite
nmake /f Makefile.msc sqlite3.dll
cp sqlite3.dll ..\artifacts\win32-x86-64
cd ..
