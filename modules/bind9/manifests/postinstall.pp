class bind9::postinstall {
 case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         service {"bind9":
      			 	      name	=> "bind9",
      	      			      ensure	=> "running"
      			}
	   }
	   'Openbsd' : {
	   	    	service {"nsd":
					name	=> "nsd",
					ensure	=> "running"
	   		}
	}
      	   'Windows': {
	   	    notify{"As soon as possible":}
	   }
      	   default: { fail("Unrecognized operating system for webserver") }
    }
}
