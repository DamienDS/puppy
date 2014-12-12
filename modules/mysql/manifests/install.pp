class mysql::install {
	case $operatingsystem {
		/^(Debian|Ubuntu)$/: {
			package { "mysql-server" :
				name	=> "mysql-server",
				ensure	=> "latest"
			}
		}
		'openbsd' : {
			package { "mysql-server" :
				name	=> "mysql-server",
				ensure	=> "latest"
			}
		}
		'windows' : {
			notify {"As soon as possible":}
		}
		default : {fail ("Unrecognized operating system for mysqlserver")}
	}
}
