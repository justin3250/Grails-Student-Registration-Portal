import justinfrancis_a20314408_as5.Course
import justinfrancis_a20314408_as5.Enrolment
import justinfrancis_a20314408_as5.User

class BootStrap {

    def init = { servletContext ->
		def user1 =new User(username:"justin", password:"b8d23ff2d94dc0a5754188ec4eec97da4b7612e4")
		user1.save(flush:true)
		def user2 = new User(username:"jason", password:"667b6d0007cf029977123417652b754bd24daf1c")
		user2.save(flush:true)
		def user3 = new User(username:"admin", password:"6260781eb6d58df2ad84927d4d1eb97e323b960b")
		user3.save(flush:true)
		
		def course1 = new Course(title: "ITMD562", description: "Basics app of PHP, Grails and Groovy",creditHours: 3 )
		course1.save(flush:true)
		def course2 = new Course(title: "ITMD515", description: "AdvancedWeb Development using ORM",creditHours: 3 )
		course2.save(flush:true)
		def course3 = new Course(title: "ITMD528", description: "Database Web app security",creditHours: 3 )
		course3.save(flush:true)
		def course4 = new Course(title: "ITMD586", description: "Web app IT Auditing",creditHours: 3 )
		course4.save(flush:true)
		def course5 = new Course(title: "ITMD422", description: "Advanced Web app Database Management",creditHours: 3 )
		course5.save(flush:true)
		def course6 = new Course(title: "ITMD555", description: "Windows Web app development",creditHours: 3 )
		course6.save(flush:true)
		def course7 = new Course(title: "ITMD566", description: "Web app Services",creditHours: 3 )
		course7.save(flush:true)
		
		def enrol1  = new Enrolment(course: course1, user: user1)
		enrol1.save(flush:true)
    }
    def destroy = {
    }
}
