defmodule Gaurd do

  #Artiry , Guard , Clauses


  def add(a,b \\0) when  is_integer(a) and is_integer(b) do
    a+b
  end


  def add(_, _) do
    "Please enter 2 numbers to be added"
  end



  #//////////////////////////////////////////////////
  def fact(0)do
    1
  end
  def fact(a)when is_integer(a)do
    a*fact(a-1)
  end
  def fact(_)do
    "Please enter a valid integer"
  end


end
