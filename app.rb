require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sendgrid-ruby'
require './classes.rb'

include SendGrid

def email()
  @email = params[:email]
  from = Email.new(email: 'mike.p.monahan@gmail.com')
  to = Email.new(email: @email)
  subject = 'Treats Catalog :3 !!'
  content = Content.new(
    type: 'text/html', 
    value: "<html>

            </html>"
  )

  mail = Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(
    api_key: ENV['SENDGRID_API_KEY']
  )

  response = sg.client.mail._('send').post(request_body: mail.to_json)
end

catcake = Confection.new("Cat Cake", "Cake", "$25.00", "KAWAII!! A delicious cake in the shape of a qt kitten!")
bearcake = Confection.new("Bear Cake", "Cake", "$20.00", "Bear-sama will never eat you!")
foxcake = Confection.new("Fox Cake", "Cake", "$35.00", "What does the fox say?  I don't know onii-chan!?")
madokacookies = Confection.new("Magica Madoka Cookies", "Cookie", "$15.00", "Will you make a pact with these tasty cookies? ;) xD")
sailorcookies = Confection.new("Sailor Moon Cookies", "Cookie", "$20.00", "Fight evil by moonlight with these scouts!")
totorocookies = Confection.new("Totoro Cookies", "Cookie", "$15.00", "Share these qt Totoro cookies with your neighbor!")
hellokittycupcakes = Confection.new("Hello Kitty Cupcakes", "Cupcake", "$5.00", "Say hello to a few of these treats! :3")
pikachucupcakes = Confection.new("Pokemon Cupcakes", "Cupcake", "$5.00", "Pika Pika!  Gotta catch all of these Cookies!")
puppycupcakes = Confection.new("Pupper Cupcakes", "Cupcake", "$5.00", "Be a good boy and get in my belly!")

get '/' do
  erb :index
end

post '/' do
  email()
  redirect '/'
end

get '/cookies' do
  @madokacookies = madokacookies
  @sailorcookies = sailorcookies
  @totorocookies = totorocookies
  erb :cookies
end

post '/cookies' do
  email()
  redirect '/cookies'
end

get '/cupcakes' do
  @hellokittycupcakes = hellokittycupcakes
  @pikachucupcakes = pikachucupcakes
  @puppycupcakes = puppycupcakes
  erb :cupcakes
end

post '/cupcakes' do
  email()
  redirect '/cupcakes'
end

get '/cakes' do
  @catcake = catcake
  @bearcake = bearcake
  @foxcake = foxcake
  erb :cakes
end

post '/cakes' do
  email()
  redirect '/cakes'
end