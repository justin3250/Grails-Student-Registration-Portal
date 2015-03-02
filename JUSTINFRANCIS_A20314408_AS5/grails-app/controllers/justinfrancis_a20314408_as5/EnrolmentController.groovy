package justinfrancis_a20314408_as5



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EnrolmentController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Enrolment.list(params), model:[enrolmentInstanceCount: Enrolment.count()]
	}

	def show(Enrolment enrolmentInstance) {
		respond enrolmentInstance
	}

	def create() {
		respond new Enrolment(params)
	}

	@Transactional
	def save(Enrolment enrolmentInstance) {
		if (enrolmentInstance == null) {
			notFound()
			return
		}

		if (enrolmentInstance.hasErrors()) {
			respond enrolmentInstance.errors, view:'create'
			return
		}

		enrolmentInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'enrolment.label', default: 'Enrolment'),
					enrolmentInstance.id
				])
				redirect enrolmentInstance
			}
			'*' { respond enrolmentInstance, [status: CREATED] }
		}
	}

	def edit(Enrolment enrolmentInstance) {
		respond enrolmentInstance
	}

	@Transactional
	def update(Enrolment enrolmentInstance) {
		if (enrolmentInstance == null) {
			notFound()
			return
		}

		if (enrolmentInstance.hasErrors()) {
			respond enrolmentInstance.errors, view:'edit'
			return
		}

		enrolmentInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Enrolment.label', default: 'Enrolment'),
					enrolmentInstance.id
				])
				redirect enrolmentInstance
			}
			'*'{ respond enrolmentInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Enrolment enrolmentInstance) {

		if (enrolmentInstance == null) {
			notFound()
			return
		}

		enrolmentInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Enrolment.label', default: 'Enrolment'),
					enrolmentInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'enrolment.label', default: 'Enrolment'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def doRegistration = {
		->

		def messageToUser = null
		def newRegistration =null

		def courseID = params.courseId
		

		if(courseID){
			def course1 = Course.findById(courseID)
			//println course1
			def user1 = User.findWhere(username:session.user.username ,password:session.user.password)
			//println user1
			def enroll = Enrolment.findWhere(course: course1 , user:user1)
			//println enroll

			if(course1 && !enroll){
				//println "inside here"
				newRegistration = new Enrolment(course: course1, user: user1)
				newRegistration.save(flush:true)
				messageToUser = "You have sucessfully enrolled for this course!"
			}

			if(course1 && enroll)
				messageToUser = "You have already enrolled for this course. Try another course!"
		}


		render(view:'/course/index',model:[message:messageToUser,courseInstanceList:Course.list()])
	}
}
