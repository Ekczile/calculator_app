require 'sinatra'
require_relative 'math.rb'

get '/' do
    erb :number1
end

post '/number1' do
    number1 = params[:num1]
    redirect '/number2?num1=' + number1
end

  get '/number2' do
    number1 = params[:num1]
    erb :number2, locals: {number1: number1}
 end

 post '/number2' do
    number1 = params[:num1]
    number2 = params[:num2]
    redirect '/operator?num1=' + number1 + '&num2=' + number2
 end

 get '/operator' do
    number1 = params[:num1]
    number2 = params[:num2]
    erb :operator, locals: {number1: number1, number2: number2}
 end
 
 post '/operator' do
    number1 = params[:num1]
    number2 = params[:num2]
    operator = params[:oper]
    redirect '/calculation?num1=' + number1 + '&num2=' + number2 + '&oper=' + operator
 end

 get '/calculation' do
    number1 = params[:num1].to_i
    number2 = params[:num2].to_i
    operator = params[:oper]
    if operator == "add"
        solution = addition(number1, number2)
        operator = "\+"
    elsif operator == "-"
        solution = subtract(number1, number2)
        operator = "-"
    elsif operator == "multi"
        solution = multiplication(number1, number2)
        operator = "*"
    elsif operator == "div"
        solution = division(number1, number2)
        operator = "/"
    end
    erb :calculation, locals: {number1: number1, number2: number2, operator: operator, solution: solution}
 end