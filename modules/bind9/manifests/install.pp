class bind9::install{
      case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         package {"bind9":
      			 	      name	=> "bind9",
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
