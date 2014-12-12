class httpd::postinstall {
case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         service {"lighttpd":
      			 	      name	=> "lighttpd",
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
