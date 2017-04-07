@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
	goto download_Cygwin_installer
) else (
	echo 管理者として実行する必要があります
	echo 何かキーを押してください。
	pause >nul
	goto end
)

:download_Cygwin_installer
mkdir C:\cygwin64\setup
cd /d C:\cygwin64\setup

if not exist C:\cygwin64\setup\setup-x86_64.exe ^
powershell -Command "(new-object System.Net.WebClient).Downloadfile('https://www.cygwin.com/setup-x86_64.exe','C:\cygwin64\setup\setup-x86_64.exe')"

C:\cygwin64\setup\setup-x86_64.exe -q -D -L ^
 -s ftp://ftp.iij.ad.jp/pub/cygwin ^
 -R C:\cygwin64 -l C:\cygwin64\setup ^
 -P ^
vim,screen,wget,lv,openssh,perl,perl-libwin32,^
git,git-completion,autoconf,automake,binutils,^
bison,flex,gcc4,gcc4-core,gcc4-g++,libtool,^
make,ncurses,patch,patchutils,readline,^
subversion,curl

pause
goto end

:end
