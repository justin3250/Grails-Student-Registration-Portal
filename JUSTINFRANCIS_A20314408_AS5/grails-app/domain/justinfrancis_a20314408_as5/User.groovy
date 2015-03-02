package justinfrancis_a20314408_as5

class User {

	//static searchable = false
	
	String username
	String password
	
	
	
    static constraints = {
		username(username:true, unique:true)
		password(blank:false, password:true)
    }
	
	
	String toString(){
		"Username is $username"
	}
}
