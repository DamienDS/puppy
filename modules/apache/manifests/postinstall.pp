class apache::postinstall {
case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         service {"apache":
      			 	      name	=> "apache2",
      	      			      ensure	=> "running"
      			}
	   }
	   'Openbsd' : {
                    notify{"As soon as possible":}
           }
      	   'Windows': {
	   	    notify{"As soon as possible":}
	   }
      	   default: { fail("Unrecognized operating system for webserver") }
    }
}
