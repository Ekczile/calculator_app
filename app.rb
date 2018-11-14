require 'sinatra'
require_relative 'math.rb'

get '/' do
    erb :number1
end

post '/number1' do
    number1 = params[:num1]
    redirect '/number2?fnum1=' + number1
   end
