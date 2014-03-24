class WelcomeController < ApplicationController
  layout "step", only: [:start, :step2, :step3]

  def index
  end
  def start
    
  end
  def step2
  end
  def step3
  end
  def step4
  end
  
  def ajax  
    a = eval '' + params[:Code]
    render :inline => a.to_s
  end
    
  def fibo
    correct = true    
    mensaje = ''
    for test in 0..7 do
      cod = add_to_code('fibonacci(' + test.to_s + ')')
      a = eval cod
      if a.to_s != fibonacci_test(test).to_s
        correct = false
      end
    end
    if correct == true
      mensaje = 'Well done!!'
      render nothing: true
    else
      mensaje = 'Sorry fibonacci function does not calculate the right value'
      render :inline => mensaje
    end
  end
  
  def fact
    correct = true    
    mensaje = ''
    for test in 0..7 do
      cod = add_to_code('factorial(' + test.to_s + ')')
      a = eval cod
      if a.to_s != factorial_test(test).to_s
        correct = false
      end
    end
    if correct == true
      mensaje = 'Well done!!'
      render nothing: true
    else
      mensaje = 'Sorry factorial function does not calculate the right value'
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
