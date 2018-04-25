require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sendgrid-ruby'

include SendGrid

get '/' do
  erb :index
end

post '/' do
  @email = params[:email]
  @subject = params[:subject]
  @message = params[:message]
  from = Email.new(email: @email)
  to = Email.new(email: 'mike.p.monahan@gmail.com')
  subject = @subject
  content = Content.new(type: 'text/plain', value: @message)
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  redirect '/'
end

##IMG CREDITS: https://lysol-jones.deviantart.com/art/Extra-Value-Combo-Alpha-66945355