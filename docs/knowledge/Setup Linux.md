## Dependencies

```sh
sudo apt install fzf \
	fd-find
	curl
	zsh
	git
```

## zsh as default shell

```sh
chsh -s $(which zsh)
```

## oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Install programs

### snap

```sh
sudo snap install nvim chezmoi code spotify
```

### cargo

```sh
curl https://sh.rustup.rs -sSf | sh
cargo install exa ripgrep zellij
```

## dotfiles

```sh
chezmoi init --apply $GITHUB_USERNAME
```

## nvim

### clipboard provider

