# class MyMailer < ActionMailer::Base
#   def sendgrid_client
#     @sendgrid_client ||= SendGrid::API.new ENV['MAILER_API_KEY']
#   end
#
#   def new_user(user)
#     template_id = "template_id_of_new_user"
#
#     data = {
#       "personalizations": [
#         {
#           "to": [
#             {
#               "email": user.email
#             }
#           ],
#           "substitutions": {
#             "-name-": "charlieforce77",
#             "-content-": user.name
#           },
#           "subject": "Welcome to Code4Us"
#         }
#       ],
#       "from": {
#         "email": "charlie.kb@bragout.com"
#       },
#       "template_id": template_id
#     }
#
#     sendgrid_client.client.mail._("send").post(request_body: data)
#   end
# end
class MyMailer < ActionMailer::Base

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new ENV['MAILER_API_KEY']
	end

	def new_user(user)
		template_name = "new-user"
		template_content = []
		message = {
			to: [{email: "#{user.email}"}],
			subject: "Welcome to Code4Pro",
			merge_vars: [
				{
					rcpt: user.email,
					vars: [{name: "USER_NAME", content: user.name}]
				}
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message
	end

	def new_receipt(user, project)
		template_name = "new-receipt"
		template_content = []
		message = {
			to: [{email: "#{user.email}"}],
			subject: "Code4Pro - Your Receipt",
			merge_vars: [
				{
					rcpt: user.email,
					vars: [
						{name: "STUDENT_NAME", content: user.name},
						{name: "PROJECT_NAME", content: project.name},
						{name: "PROJECT_PRICE", content: project.price}
					]
				}
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message
	end

end
