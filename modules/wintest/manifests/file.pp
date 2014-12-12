class wintest::file { 
	file { 'c:/hello.txt': 
			content => "Helle master !"
	}
}
