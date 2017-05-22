function cvn
	cd /opt/; l
end

function fish_prompt
	set_color FB0 --bold
	echo
	echo "$USER"@(prompt_hostname)(set_color normal)(set_color 9AA) (date +%T)
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

function hw
	task project.contains:school urgency.above:0 next
end

function work
	task project.contains:work urgency.above:0 next
end
