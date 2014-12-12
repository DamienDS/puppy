class apache::node (
ensure	= ""
){
     anchor {"apache::begin":
     }->
     class {"apache::install":
     }->
     class {"apache::postinstall":
     }->
     anchor {"apache::end":
     }
}