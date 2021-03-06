#!/usr/bin/python
from subprocess import call
import os

def file_exists(fname):
    try:
        os.stat(fname)
        return True
    except OSError:
        return False

packages = "vim fish zsh task timewarrior figlet flatpak thunderbird"
if file_exists('/usr/bin/zypper'):
    call("sudo zypper in " + packages, shell=True)
elif file_exists('/usr/bin/apt-get'):
    call("sudo apt install " + packages + " -y", shell=True)
else:
    raise OSError, "cannot find a usable package manager. The following packages must be installed: " + packages
    sys.exit()

call("echo '. ~/user-sync/bash_aliases' > ~/.bash_aliases", shell=True)
call("echo '. ~/user-sync/bashrc' > ~/.bashrc", shell=True)

call("sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'", shell=True)
call('git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions', shell=True)
call(' git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search', shell=True)
call(' git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting', shell=True)
call("echo '. ~/user-sync/zshrc' > ~/.zshrc", shell=True)

call("echo 'source ~/user-sync/config.fish' > ~/.config/fish/config.fish", shell=True)

call("ln -s ~/user-sync/taskrc ~/.taskrc", shell=True)

call("wget -O xt  http://git.io/v6JYg && chmod +x xt && ./xt && rm xt", shell=True)

call("git config credential.helper store", shell=True)

call("echo 'source ~/user-sync/vimrc' > ~/.vimrc", shell=True)
call("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim", shell=True)
call("vim +PluginInstall +qall", shell=True)

fishorbash = raw_input("Would you like to use fish, bash, or zsh? (f/b/z)")
if fishorbash == "f":
    call("chsh -s /usr/bin/fish", shell=True)
if fishorbash == "z":
    call("chsh -s /usr/bin/zsh", shell=True)
