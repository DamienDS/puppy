class openssl::script{
  file {"/etc/ssl/openssl.sh":
      source => 'puppet:///modules/openssl/openssl.sh',
      mode  => '0755',
  }
}
