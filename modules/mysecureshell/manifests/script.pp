class mysecureshell::script {
	file { "/home/mssDepot.sh" :
		ensure	=> 'file',
		source	=> 'puppet:///modules/mysecureshell/mssDepot.sh',
		mode	=> '0755'
	}->
	exec {"/home/mssDepot.sh":
		logoutput	=> on_failure,
		loglevel	=> verbose
	}
}
