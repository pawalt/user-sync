#!/usr/bin/python
from subprocess import call
import os

def file_exists(fname):
    try:
        os.stat(fname)
        return True
    except OSError:
        return False

packages = "vim fish task figlet flatpak thunderbird"
if file_exists('/usr/bin/zypper'):
    call("sudo zypper in " + packages + " -y", shell=True)
elif file_exists('/usr/bin/apt-get'):
    call("sudo apt install " + packages + " -y", shell=True)
else:
    raise OSError, "cannot find a usable package manager. The following packages must be installed: " + packages
    sys.exit()

call("echo '. ~/user-sync/bash_aliases' > ~/.bash_aliases", shell=True)
call("echo '. ~/user-sync/bashrc' > ~/.bashrc", shell=True)

call("echo 'source ~/user-sync/config.fish' > ~/.config/fish/config.fish", shell=True)

call("ln -s ~/user-sync/taskrc ~/.taskrc", shell=True)

call("wget -O xt  http://git.io/v6JYg && chmod +x xt && ./xt && rm xt", shell=True)

call("git config credential.helper store", shell=True)

call("echo 'source ~/user-sync/vimrc' > ~/.vimrc", shell=True)
call("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim", shell=True)
call("vim +PluginInstall +qall", shell=True)

fishorbash = raw_input("Would you like to use fish or bash? (f/b)")
if fishorbash == "f":
    call("chsh -s /usr/bin/fish", shell=True)
