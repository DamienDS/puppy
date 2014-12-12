class apache::node (
$ensure			= "present",
$vhosts_ensure	= "absent",
$vhosts			= undef
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