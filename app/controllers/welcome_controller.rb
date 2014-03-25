class WelcomeController < ApplicationController
  layout "step", only: [:step1, :step2, :step3, :step4]

  def index
  end
  def step1
  end
  def step2
  end
  def step3
  end
  def step4
  end
  
  def ajax
    begin
      a = eval '' + params[:Code]
    rescue Exception => e
      a = "There was an error with your code"
     end    
    render :inline => a.to_s
  end
    
  def fibo
    correct = 0    
    mensaje = ''
    begin
      for test in 0..7 do
        cod = add_to_code('fibonacci(' + test.to_s + ')')
        a = eval cod
        if a.to_s != fibonacci_test(test).to_s
          correct = 1
        end
      end
    rescue Exception => e
      correct = 2
    end
    if correct == 0
      mensaje = 'Well done!!'
      render nothing: true
    else
      if correct == 1
        mensaje = 'Sorry, your fibonacci function does not calculate the right value'
      else
        mensaje = 'You have a sintax error in your code'
      end
      render :inline => mensaje
    end
  end
  
  def fact
    correct = 0
    mensaje = ''
    begin
      for test in 0..7 do
        cod = add_to_code('factorial(' + test.to_s + ')')
        a = eval cod
        if a.to_s != factorial_test(test).to_s
          correct = 1
        end
      end
    rescue Exception => e
      correct = 2
    end
    if correct == 0
      mensaje = 'Well done!!'
      render nothing: true
    else
      if correct == 1
        mensaje = 'Sorry, your factorial function does not calculate the right value'
      else
        mensaje = 'You have a sintax error in your code'
      end
      render :inline => mensaje
    end
  end
  
  def add_to_code(s)
    return '' + params[:Code] + "\n" + s
  end
  
  def fibonacci_test(n)
    if n == 0 or n == 1
      return 1
    else
      if n > 1
        parent = 1
        grandparent = 1
        actual = 0
        for i in 2..n do
          actual = parent + grandparent
          grandparent = parent
          parent = actual
        end
        return actual 
      end
    end
  end
  
  def factorial_test(n)
    if n == 0
      return 1
    else
      if n > 0
        actual = 1
        for i in 1..n do
          actual = actual * i
        end
        return actual 
      end
    end
  end
  
end
