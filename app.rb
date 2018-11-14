require 'sinatra'
require_relative 'math.rb'

get '/' do
    erb :number1
end

post '/number1' do
    number1 = params[:num1]
    redirect '/operator?fnum1=' + number1
end

  get '/operator' do
    number1 = params[:num1]
    erb :number2, locals: {number1: number1}
 end

 post '/operator' do
    number1 = params[:num1]
    number2 = params[:num2]
    redirect '/calculation?num1=' + number1 + '&num2=' + number2
 end
