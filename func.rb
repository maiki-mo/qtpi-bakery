def email()
  @email = params[:email]
  from = Email.new(email: 'qtpies@gmail.com')
  to = Email.new(email: @email)
  subject = 'CUTE MUFFINS!! ;3 ;3 ;3'
  content = content = Content.new(
    type: 'text/plain', 
    value: 'i heard u lyke qtPIs'
  )
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
end