#function fish_prompt
#	set_color FB0 --bold
#	echo
#	echo "$USER"@(hostname)(set_color normal)(set_color 9AA) (date +%T)
#	set_color normal
#	echo '' (prompt_pwd) '> '
#end

function fish_right_prompt
    date '+%T'
end

function l
	ls -CF $argv
end

function ll
	ls -alh $argv
end

function p	
	ping $argv
end

function pg
	ping google.com
end

function rg
	grep -i -r $argv
end

function ssr
	ssh -l root $argv
end

function svq
	svn update
	svn status
end

function note
	~/user-sync/scripts/note.py $argv
end

function vim
    nvim $argv
end

function ed
    emacs --daemon
end

function ec
    emacsclient $argv
end

set -x EDITOR nvim

set theme_color_scheme base16-dark
