# Cygwinセットアップメモ(2016/07/20)

# 基本的なセットアップ

## 64bit版

[cygwin_setup_64bit.bat](cygwin_setup_64bit.bat) をダウンロードし、管理者として実行する。


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

# minttyとvimの設定

Cygwin Terminal を開き、以下のコマンドをペースト

	cat > .minttyrc << 'EOS'
	BoldAsFont=no
	Font=ＭＳ ゴシック
	Locale=ja_JP
	Charset=UTF-8
	Columns=150
	Rows=50
	EOS
	
	cat > .vimrc << 'EOS'
	syntax on
	set wildmenu
	set history=100
	set scrolloff=5
	set autowrite
	set tabstop=4
	set shiftwidth=4
	set softtabstop=0
	set termencoding=utf-8
	set encoding=utf-8
	set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,ucs2le,ucs-2
	set fenc=utf-8
	set enc=utf-8
	EOS

exit でいったん終了し、再度 Cygwin Terminal を起動する。

# apt-cygの導入

	curl -o /usr/local/bin/apt-cyg https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
	chmod 755 /usr/local/bin/apt-cyg
	apt-cyg -v
	apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update

* [Cygwinのインストールとapt-cygのインストール](http://qiita.com/FSMS/items/68b5956301d987d1be2b)
* [apt-cygのGitHubレポジトリが閉鎖されてる](http://rcmdnk.github.io/blog/2016/02/01/computer-windows-cygwin/)

