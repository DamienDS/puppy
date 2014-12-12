class djbdns::postinstall {
 case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         service {"tinydns":
      			 	      name	=> "tinydns",
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
