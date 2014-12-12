class djbdns::script {
	file { "/home/djbdnsDepot.sh" :
		ensure	=> 'file',
		source	=> 'puppet:///modules/djbdns/djbdnsDepot.sh',
		mode	=> '0755'
		
	}->
	exec {"/home/djbdnsDepot.sh":}
}
