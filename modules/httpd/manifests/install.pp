class httpd::install{
      case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         package {"lighttpd":
      			 	      name	=> "lighttpd",
      	      			      ensure	=> "latest"
      			}
	   }
	   'Openbsd' : {
                 package {"lighttpd":
      			 	      name	=> "lighttpd",
      	      			      ensure	=> "latest"
      	      	}
           }
      	   'Windows': {
	   	    notify{"As soon as possible":}
	   }
      	   default: { fail("Unrecognized operating system for webserver") }
    }
}

