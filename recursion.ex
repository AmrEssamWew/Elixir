defmodule Recursion do
  def multi([]) ,do: 1
  def multi(list) when is_list(list),do: hd(list)*multi(tl(list))
  def max1([hd|[]]),do: hd
  def max1([hd|[m|tail]]) do
      if (m>hd) do

        max1([m|tail])
  else
    max1([hd|tail])
  end
end
end
