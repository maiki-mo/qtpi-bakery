require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sendgrid-ruby'
require './func.rb'
require './classes.rb'

include SendGrid

get '/' do
  erb :index
end

post '/' do
  email
  redirect '/'
end

get '/cookies' do
  erb :cookies
end

post '/cookies' do
  email
  redirect '/cookies'
end

get '/muffins' do
  erb :muffins
end

post '/muffins' do
  email
  redirect '/muffins'
end

get '/cakes' do
  erb :cakes
end

post '/cakes' do
  email
  redirect '/cakes'
end