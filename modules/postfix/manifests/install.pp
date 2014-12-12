class postfix::install {
	case $operatingsystem {
		/^(Debian|Ubuntu)$/: {
			package {"postfix":
				name	=> "postfix",
				ensure	=> "latest"
			}
		}
		'Openbsd' : {
			notify{"As soon as possible":}
		}
		'windows' : {
			notify {"As soon as possible":}
		}
		default: { fail("Unrecognized operating system for webserver") }
	}
}
