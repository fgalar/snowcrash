catch syscall ptrace

commands 1
	set $eax=0
	continue
end

start
ju *0x8048de5
