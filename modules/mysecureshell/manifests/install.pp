class mysecureshell::install {
	case $operatingsystem {
		/^(Debian|Ubuntu)$/: {
			package { "mysecureshell" :
				name	=> "mysecureshell",
				ensure	=> "latest"
			}
		}
		'openbsd' : {
			notify { "As soon as possible":}
		}
		'Windows' : {
			notify { "As soon as possible":}
		}
		default : {fail ("Unreconized operating system for sftpserver") }
	}
	
}
