defmodule Game_interface do
  def start_game() do
    Game_server.start_server()
    send(:game,{:info,self()})
    receive do
      {:info, stones_num} -> IO.puts("Welcome to game of stones..there are #{stones_num} and in each turn, a player take from 1 to 5 stones.... the player to take the last stone loses")
      Game_interface.game_turn({1,stones_num})
    end

  end
  def game_turn({player,stones_num}) do
  send(:game,{:turn,self(),player,stones_num,stones_input()})
  receive do
    {:ok, player,stones_num} -> IO.puts("it's player #{player} turn & there are #{stones_num} stones left")
      game_turn({player,stones_num})
    {:error, player,stones_num} -> IO.puts("you can only take from 1 to 5 stones and the number of stones taken can't exceed the total number of stones")
    game_turn({player,stones_num})
    {:winner, player} -> IO.puts("player #{player} wins the game")

  end
  end
  def stones_input() do
    IO.gets("\nEnter the number of stones you wish to take\n") |> Integer.parse() |> parsing_integer()
  end
  def parsing_integer({input,_}) ,do: input
  def parsing_integer(:error) ,do: 0
end



defmodule Game_server do
  def start_server()do
    spawn(fn  ->listen({1,50})  end) |> Process.register(:game)
  end
  def listen({player,stones_num}) do
 new_State=receive do
  {:info, sender} -> send(sender,{:info,50})
  {player,stones_num}
  {:turn, sender,player,stones_num,stones_to_take} -> process({sender,player,stones_num,stones_to_take})
 end
 listen(new_State)

  end
  def process({sender,player,stones_num,stones_to_take})when stones_to_take<1 or stones_to_take>5 or stones_to_take>stones_num do
    send(sender,{:error, player,stones_num})
    {player,stones_num}
  end
  def process({sender,player,stones_num,stones_to_take})when stones_to_take ==stones_num do
    send(sender,{:winner, player})

  end
  def process({sender,player,stones_num,stones_to_take}) do
   new_Stones_num=stones_num - stones_to_take
   next_player=next(player)
   send(sender, {:ok, next_player,new_Stones_num})
   {next_player,new_Stones_num}
  end
  def next(1),do: 2
  def next(2),do: 1
end
Game_interface.start_game
