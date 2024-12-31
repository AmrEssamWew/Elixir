defmodule Build_in do

  list=[1,2,3,4]


  def delete(list),do: List.delete_at(list,1)
  def check(list),do: Enum.all?(list,&Kernel.is_integer/1)






end
