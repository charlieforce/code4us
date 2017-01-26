class MyMailer < ActionMailer::Base
  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "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")
  end

  def new_user(user)
    template_id = "template_id_of_new_user"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "charlieforce77",
            "-content-": user.name
          },
          "subject": "Welcome to Code4Us"
        }
      ],
      "from": {
        "email": "charlie.kb@bragout.com"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end
