defmodule Comprehensions do
  require Integer
def trans(list,list1) do
  for el <- list, el1 <-list1, Integer.is_even(el),Integer.is_odd(el1), do: {el,el1}
end
def opt(list) do
  Stream.filter(list,&Integer.is_even/1)|> Enum.map(&IO.inspect/1)
end
def decipher(str) do
  str
  |> String.to_charlist()        # Convert string to a charlist
  |> Stream.map(&(&1 - 1))       # Shift each character back in the alphabet
  |> Enum.map(&<<&1::utf8>>)     # Convert each integer back to a character
  |> Enum.join("")               # Join the characters into a string
end


end
list=[1,2,3,4]
list1=[5,6,7,8]
data="fmjyjs"

Comprehensions.trans(list,list1) |> IO.inspect()
Comprehensions.opt(list)
Comprehensions.decipher(data) |> IO.inspect()
