class postfix::postinstall {
	case $operatingsystem {
		/^(Debian|Ubuntu)$/: {
			service {"postfix":
				name	=> "postfix",
				ensure	=> "running"
			}
		}
		'Openbsd' : {
			notify{"As soon as possible":}
		}
		'Windows': {
			notify{"As soon as possible":}
		}
		default: { fail("Unrecognized operating system for postfix") }
	}
}
