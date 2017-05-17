function fish_prompt
	set_color FB0 --bold
	echo
	echo "$USER"@(prompt_hostname)(set_color normal)(set_color 9AA) (date)
	set_color normal
	echo '' (prompt_pwd) '> '
end

