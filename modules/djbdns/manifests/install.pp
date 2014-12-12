class djbdns::install{
      case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         package {"djbdns":
      			 	      name	=> "djbdns",
      	      			      ensure	=> "latest"
      			}
	   }
	   'Openbsd' : {
			package {"nsd":
					name	=> "nsd",
					ensure	=> "latest"
	   		}
	}
      	   'Windows': {
	   	    notify{"As soon as possible":}
	   }
      	   default: { fail("Unrecognized operating system for webserver") }
    }
}
