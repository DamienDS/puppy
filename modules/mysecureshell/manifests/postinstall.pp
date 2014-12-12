class mysecureshell::postinstall {
 case $operatingsystem {
      	   /^(Debian|Ubuntu)$/: {
	   	         service {"mysecureshell":
      			 	      name	=> "mysecureshell",
      	      			      ensure	=> "running"
      			}
	   }
	   'Openbsd' : {
	   	    	notify {"As soon as possible":}
	}
      	   'Windows': {
	   	    notify{"As soon as possible":}
	   }
      	   default: { fail("Unrecognized operating system for sftpserver") }
    }
}
