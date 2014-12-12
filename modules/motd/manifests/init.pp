class motd::config {
	file {"/etc/motd":
		owner	=> 'root',
		group	=> 'root',
		mode	=> 0644,
		content	=> template("/etc/puppet/modules/motd/templates/motd.erb"),
	}
}

class motd {
	include motd::config
}
