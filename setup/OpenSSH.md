# sshdの設定

* 事前にOpenSSHをインストールしておく
* 管理者モードで minttyを起動
* パスワードはパスワードポリシー要件を満たすものにする
* minttyの文字コードをSJISにしておくとよい(パスワードエラーがcp932であるため)

### OpenSSHのチェック

	$ cygcheck -cd openssh
	Cygwin Package Information
	Package              Version
	openssh              7.5p1-1


### セットアップ

	$ ssh-host-config
	
	*** Info: Generating missing SSH host keys
	*** Info: StrictModes is set to 'yes' by default.
	*** Info: This is the recommended setting, but it requires that the POSIX
	*** Info: permissions of the user's home directory, the user's .ssh
	*** Info: directory, and the user's ssh key files are tight so that
	*** Info: only the user has write permissions.
	*** Info: On the other hand, StrictModes don't work well with default
	*** Info: Windows permissions of a home directory mounted with the
	*** Info: 'noacl' option, and they don't work at all if the home
	*** Info: directory is on a FAT or FAT32 partition.
	*** Query: Should StrictModes be used? (yes/no) yes
	*** Info: Updating /etc/sshd_config file
	
	*** Query: Do you want to install sshd as a service?
	*** Query: (Say "no" if it is already installed as a service) (yes/no) yes
	*** Query: Enter the value of CYGWIN for the daemon: []
	*** Info: On Windows Server 2003, Windows Vista, and above, the
	*** Info: SYSTEM account cannot setuid to other users -- a capability
	*** Info: sshd requires.  You need to have or to create a privileged
	*** Info: account.  This script will help you do so.
	
	*** Info: It's not possible to use the LocalSystem account for services
	*** Info: that can change the user id without an explicit password
	*** Info: (such as passwordless logins [e.g. public key authentication]
	*** Info: via sshd) when having to create the user token from scratch.
	*** Info: For more information on this requirement, see
	*** Info: https://cygwin.com/cygwin-ug-net/ntsec.html#ntsec-nopasswd1
	
	*** Info: If you want to enable that functionality, it's required to create
	*** Info: a new account with special privileges (unless such an account
	*** Info: already exists). This account is then used to run these special
	*** Info: servers.
	
	*** Info: Note that creating a new user requires that the current account
	*** Info: have Administrator privileges itself.
	
	*** Info: No privileged account could be found.
	
	*** Info: This script plans to use 'cyg_server'.
	*** Info: 'cyg_server' will only be used by registered services.
	*** Query: Do you want to use a different name? (yes/no) no
	*** Query: Create new privileged user account 'SERVERNAME\cyg_server' (Cygwin name: 'cyg_server')? (yes/no) yes
	*** Info: Please enter a password for new user cyg_server.  Please be sure
	*** Info: that this password matches the password rules given on your system.
	*** Info: Entering no password will exit the configuration.
	*** Query: Please enter the password:
	*** Query: Reenter:
	
	*** Info: User 'cyg_server' has been created with password 'PASSWORD'.
	*** Info: If you change the password, please remember also to change the
	*** Info: password for the installed services which use (or will soon use)
	*** Info: the 'cyg_server' account.
	
	
	*** Info: The sshd service has been installed under the 'cyg_server'
	*** Info: account.  To start the service now, call `net start sshd' or
	*** Info: `cygrunsrv -S sshd'.  Otherwise, it will start automatically
	*** Info: after the next reboot.
	
	*** Info: Host configuration finished. Have fun!

### サーバ起動

	$ cygrunsrv -S sshd

### ファイアーウォールの設定

22/TCPを解放する

	$ cmd /C start "" WF.msc
