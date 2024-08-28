complete -c icinga -n "__fish_use_subcommand" -f -a '(icinga commands)' -d 'subcommand'

function __fish_cache_icinga_hosts
	if test -z "$__cached_icinga_hosts"
		set -g __cached_icinga_hosts (icinga hosts)
	end
	printf "%s\n" $__cached_icinga_hosts
end

function __fish_cache_icinga_services
	if test -z "$__cached_icinga_services"
		set -g __cached_icinga_services (icinga services)
	end
	printf "%s\n" $__cached_icinga_services
end

function __fish_complete_icinga_hosts
	__fish_cache_icinga_hosts
end

function __fish_complete_icinga_services
	set host $argv[1]
	__fish_cache_icinga_services | grep $host | cut -f2 -d\t
end

complete -c icinga -n '__fish_seen_subcommand_from show; and not __fish_seen_subcommand_from (__fish_complete_icinga_hosts | cut -f1 -d\t)' -x -a '(__fish_complete_icinga_hosts)'

for host in (__fish_complete_icinga_hosts | cut -f1 -d\t)
	complete -c icinga -n "__fish_seen_subcommand_from show; and __fish_seen_subcommand_from $host; and not __fish_seen_subcommand_from (__fish_complete_icinga_services $host)" -a "(__fish_complete_icinga_services $host)" -x
end
