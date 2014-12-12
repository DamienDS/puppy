class mysql::postinstall {
	case $operatingsystem {
		/^(Debian|Ubuntu)$/: {
			service { "mysql":
				name	=> "mysql",
				ensure	=> "running"
			}
		}
		'openbsd': {
			service { "mysqld":
				name	=> "mysql-server",
				ensure	=> "running" 
			}
		}
		'windows': {
			notify {"As soon as possible":}
		}
		default: { fail ("Unrecognized operating system for mysqlserver")}
	}
}
