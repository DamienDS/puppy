class openssl::configuration {
        file {"/etc/ssl/openssl.cnf":
                owner   => 'root',
                group   => 'root',
                mode    => 0644,
                content => template("/etc/puppet/modules/openssl/templates/openssl.cnf.erb"),
        }
}
