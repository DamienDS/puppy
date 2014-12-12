class openssl::install{
      case $operatingsystem {
           /^(Debian|Ubuntu)$/: {
                         package {"openssl":
                                      name      => "openssl",
                                      ensure    => "latest"
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
