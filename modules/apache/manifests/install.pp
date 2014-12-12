class apache::install{
      case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         package {"apache2":
      			 	      name	=> "apache2",
      	      			      ensure	=> "latest"
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
