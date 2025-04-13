set history save
set verbose off
set print pretty on
set print array on

tui new-layout deftui src 1 {-horizontal asm 2 regs 3} 2 cmd 2 status 1

set tui border-mode half
set tui active-border-mode bold
set tui tab-width 4
set tui compact-source on

layout deftui

set auto-load safe-path /
break panic

define p_link_list
	set var $n = $arg0
	while $n
		print *($n)
		set var $n = $n->next
	end
end
