package justinfrancis_a20314408_as5



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def SALT = "word"
	

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond User.list(params), model:[userInstanceCount: User.count()]
	}

	def show(User userInstance) {
		respond userInstance
	}

	def create() {
		respond new User(params)
	}

	@Transactional
	def save(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}

		userInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'user.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*' { respond userInstance, [status: CREATED] }
		}
	}

	def edit(User userInstance) {
		respond userInstance
	}

	@Transactional
	def update(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'edit'
			return
		}

		userInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*'{ respond userInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(User userInstance) {

		if (userInstance == null) {
			notFound()
			return
		}

		userInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
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
					message(code: 'user.label', default: 'User'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def doLogin = {
		->

		//def username1 = params.username
		//def password1 = params['password']

		def messageToUser = null
		def userLoggedIn = null
		
		String passwordHash = params.password + SALT
		passwordHash = passwordHash.encodeAsSHA1()
		
		

		def user = User.findWhere(username:params.username,
		password:passwordHash)
		
		

		if (user)
			//redirect(controller:'plant',action:'list')
		{
			session.user = user
			messageToUser = "Sucessfully logged in!"
			render(view:"/user/index.gsp",model:[message:messageToUser])
		}
		else
		{
			messageToUser = "Username or Password incorrect. Please try again!"
			render(view:'/index',model:[message:messageToUser])
		}



		//render(view:"index")
	}

	def doLogout = {
		->

		session.user =session.new

		render(view:'/index',model:[message:"Sucessfully Logged out!"])
	}

	def userRegister = {
		->

		//def username1 = params.username
		//def password1 = params['password']

		def messageToUser = null
		def userLoggedIn = null

		
		def user = User.findWhere(username:params.username)

		if (user)
			//redirect(controller:'plant',action:'list')
		{
			//session.user = user
			messageToUser = "Username already exists. Please register with another username"
			render(view:'/index',model:[message:messageToUser])
		}
		else
		{
			String passwordHash = params.password + SALT
			passwordHash = passwordHash.encodeAsSHA1()
			def user1 =new User(username:params.username, password:passwordHash)
			user1.save(flush:true)
			messageToUser = "Sucessfully registered! Please login to acess your account!"
			render(view:'/index',model:[message:messageToUser])
		}



		//render(view:"index")
	}
}
