require 'sinatra'
require 'byebug'

require './guest.rb'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  'Hello world!'
end

get '/party' do
  @guests = Guest.load_guests
  erb :party
end

get '/signup' do
  @guests = Guest.load_guests
  erb :signup
end

post '/signup/guests' do
  Guest.load_guests
  p params['guest_website']
  guest = Guest.new(
    params['guest_name'],
    params['guest_number_of_friends'],
    params['guest_time_of_arrival'],
    params['guest_website']
  )

  guest.add_to_list

  redirect '/party'
end

get '/example_form' do
  erb :example_form
end

post '/example_form' do
  erb :form_result
end
