defmodule MyApp do
 def plus(a,b) do

  a+b
 end

  def multi(a,b) do
    hi()
    a*b
  end

  defp hi do
    IO.puts("Hi Private")
  end





end
