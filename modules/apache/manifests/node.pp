class apache::node (
$ensure			= "present",
){
	if ($ensure == "present")
	{
		 anchor {"apache::begin":
		 }->
		 class {"apache::install":
		 }->
		 class {"apache::postinstall":
		 }->
		 anchor {"apache::end":
		 }
	}
	else
	{
		class {"apache::uninstall":
		}
	}
}