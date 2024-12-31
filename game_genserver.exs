defmodule GameServer do
 use GenServer
 def init({1,stones_num}) do
  IO.puts("\n it's player 1 turn \n the total number of stones is #{stones_num} \n ")
  {:ok,{1,stones_num}}

 end
 def start(stones_num\\30) do

   GenServer.start(__MODULE__,{1,stones_num},name: __MODULE__)
 end
 def take({stones_to_take}) do
   GenServer.call(__MODULE__,{:take,stones_to_take})
 end
 def handle_call({:take,stones_to_take}, _, {player,stones_num}) when  stones_to_take==stones_num  do
  {:stop, :normal, {:Winner, "Player #{next(player)} is the winner"}, {1, 0}}
  end
 def handle_call({:take,stones_to_take}, _ , {player,stones_num}) when stones_to_take not in 1..3 or stones_to_take>stones_num  do

 { :reply,{:error,"you can take from 1 to 3 stones only and you can't take more stones than the total number of stones"},{player,stones_num}}
 end
 def handle_call({:take,stones_to_take}, _, {player,stones_num})   do

  new_stones_num=stones_num- stones_to_take
  nextplayer=next(player)
  { :reply,{:ok,"\n it's player #{nextplayer} turn \n the total number of stones is #{new_stones_num} \n "},{nextplayer,new_stones_num}}
  end
  defp next(1) ,do: 2
  defp next(2),do: 1

end
defmodule GameInterface do
  def startgame(stones_num\\30) do
    IO.puts("Welcome to game of stones..there are #{stones_num} and in each turn, a player take from 1 to 5 stones.... the player to take the last stone loses")
    GameServer.start(stones_num)
   game()
  end
  defp game do

    case   GameServer.take({stones_input()}) do
       {:ok,message}->IO.puts(message)
       game()
       {:error,message}->IO.puts(message)
       game()
       {:Winner,message}->IO.puts(message)
       GameInterface.startgame
    end
  end
defp stones_input,do: IO.gets("\nPlease enter the number of stones you would like to take\n") |> String.trim()|>parse()
  defp parse(input) do

    try do
      {num,_} = Integer.parse(input)
      num
    rescue
      _ -> 0
    end

  end

end
GameInterface.startgame
