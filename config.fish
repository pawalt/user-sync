function cvn
	cd /opt/; l
end

function fish_prompt
	set_color FB0 --bold
	echo
	echo "$USER"@(hostname)(set_color normal)(set_color 9AA) (date +%T)
	set_color normal
	echo '' (prompt_pwd) '> '
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

function vime
	vim "+set mouse=a" $argv
end

function note
	~/user-sync/scripts/note.py $argv
end

function hw
	task project.contains school urgency.above:0 next
end

function work
	task project.contains work urgency.above:0 next
end

set EDITOR vim
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_command FF9400
set fish_color_comment A63100
set fish_color_autosuggestion FFC473
set fish_color_end FF4C00
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param FFC000
set fish_color_quote BF9C30
set fish_color_redirection BF5B30
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_selection \x2d\x2dbackground\x3dpurple
set fish_color_user green
set fish_color_valid_path \x2d\x2dunderline
set fish_color_error ff0000
