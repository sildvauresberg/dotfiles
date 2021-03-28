rm ~/.zshrc
rm -rf ~/.oh-my-zsh/custom
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.dircolors
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.p10k.zsh

ln -s ~/projects/dotfiles/.zshrc      ~/.zshrc
ln -s ~/projects/dotfiles/.zsh_custom ~/.zsh_custom
ln -s ~/projects/dotfiles/.gitconfig  ~/.gitconfig
ln -s ~/projects/dotfiles/.gitignore  ~/.gitignore
ln -s ~/projects/dotfiles/.dircolors  ~/.dircolors
ln -s ~/projects/dotfiles/.tmux.conf  ~/.tmux.conf
ln -s ~/projects/dotfiles/.vimrc      ~/.vimrc
ln -s ~/projects/dotfiles/.p10k.zsh   ~/.p10k.zsh

ls -lah ~/.zshrc
ls -lah ~/.zsh_custom
ls -lah ~/.gitconfig
ls -lah ~/.gitignore
ls -lah ~/.dircolors
ls -lah ~/.tmux.conf
ls -lah ~/.vimrc
ls -lah ~/.p10k.zsh

