string = "Cakes: \n
#{@catcake.to_s} \n
#{@bearcake.to_s} \n
#{@foxcake.to_s} \n
Cookies: \n
#{@madokacookies.to_s} \n
#{@totorocookies.to_s} \n
#{@sailorcookies.to_s} \n
Cupcakes: \n
#{@hellokittycupcakes.to_s} \n
#{@pikachucupcakes.to_s} \n
#{@puppycupcakes.to_s} \n
"

def email()
  @email = params[:email]
  from = Email.new(email: 'qtpies@gmail.com')
  to = Email.new(email: @email.to_s )
  subject = 'CUTE MUFFINS!! ;3 ;3 ;3'
  content = content = Content.new(
    type: 'text/plain', 
    value: "#{string}"
  )
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  binding.pry
end