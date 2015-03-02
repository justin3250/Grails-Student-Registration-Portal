package justinfrancis_a20314408_as5

class Course {

	static searchable = true
	
	String title
	String description
	Integer creditHours
	
	
	String toString(){
		"""\
			Course ID is $id \n Title is: $title \n 
			Credit Hours are: $creditHours \n 
			Description is: $description \n
			"""
	}
	
    static constraints = {
		title(blank:false)
		description(blank:false)
		creditHours(blank:false)
    }
}
