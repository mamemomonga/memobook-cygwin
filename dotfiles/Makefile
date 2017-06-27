.PHONY: clean

dotfiles.tar.gz: .minttyrc .tmux.conf .vimrc
	tar zcvf $@ .minttyrc .tmux.conf .vimrc

clean:
	rm -f dotfiles.tar.gz

