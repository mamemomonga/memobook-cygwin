# Cygwinセットアップメモ(2016/07/20)

# 基本的なセットアップ

## 64bit版

[cygwin_setup_64bit.bat](cygwin_setup_64bit.bat) をダウンロードし、管理者として実行する。

cmd.exe を管理者で起動して、以下のコマンドを実行してもよい。

	cd /d %USERPROFILE%\Desktop
	powershell -Command "(new-object System.Net.WebClient).Downloadfile('https://raw.githubusercontent.com/mamemomonga/memobook-cygwin/master/setup/cygwin_setup_64bit.bat', 'cygwin_setup_64bit.bat')"
	cygwin_setup_64bit.bat


## 32bit版

1. C:\cygwin\setup を作る

2. [cygwin.com](https://www.cygwin.com/) から  [setup-x86.exe (32-bit installation)](https://www.cygwin.com/setup-x86.exe) を取得し、C:\cygwin\setup に入れる。

3. 管理者モードでコマンドプロンプトを立ち上げる。

以下のコマンドをペーストする

	C:\cygwin\setup\setup-x86.exe -q -D -L ^
	 -s ftp://ftp.iij.ad.jp/pub/cygwin ^
	 -R C:\cygwin -l C:\cygwin\setup ^
	 -P ^
	vim,screen,wget,lv,openssh,perl,perl-libwin32,^
	git,git-completion,autoconf,automake,binutils,^
	bison,flex,gcc4,gcc4-core,gcc4-g++,libtool,^
	make,ncurses,patch,patchutils,readline,^
	subversion,curl

Enter を押す。動作が止まったらEnterを押してプロンプトがでたら終了しているので exit で閉じる

# mintty, vim, tmuxの基本的な設定

Cygwin Terminal を開き、以下のコマンドをペースト

	$ curl https://raw.githubusercontent.com/mamemomonga/memobook-cygwin/master/dotfiles/dotfiles.tar.gz | tar zxv

exit でいったん終了し、再度 Cygwin Terminal を起動する。

# デスクトップにsymlinkを貼る

	$ ln -s $(cygpath -u "$USERPROFILE")/Desktop Desktop

# apt-cygの導入

	curl -o /usr/local/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
	chmod 755 /usr/local/bin/apt-cyg
	apt-cyg -v
	apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update

* [Cygwinのインストールとapt-cygのインストール](http://qiita.com/FSMS/items/68b5956301d987d1be2b)
* [apt-cygのGitHubレポジトリが閉鎖されてる](http://rcmdnk.github.io/blog/2016/02/01/computer-windows-cygwin/)

