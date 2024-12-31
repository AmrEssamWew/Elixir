defmodule Tails do
  #/////////////////////////////////////////////
  def fact(value) ,do: multi(1,value)
  defp multi(result,0),do: result
  defp multi(result,value),do: result*value |> multi(value-1)
#////////////////////////////////////////////////////
def listMulti([head|tail]),do: opMulti(1,[head|tail])
defp opMulti(value,[]),do: value
defp opMulti(value,[head|tail]),do: opMulti(value*head,tail)
#////////////////////////////////////////////////////

#////////////////////////////////////////////////////
def max([mx|[]]),do: mx
def max([mx|[hd|tail]])when hd>mx do
  max([hd|tail])
end
def max([mx|[_hd|tail]]) do
  max([mx|tail])
end
end
#/////////////////////////////////////////////////////////
