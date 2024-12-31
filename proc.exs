defmodule Proc do
  def work do
    spawn fn  ->
    receive do
      {sender, i} ->
       :timer.sleep(2000)
       send(sender, i*:rand.uniform())

    end


    end
  end

  def run do
    1..5|>Enum.each(fn(i)->

    pid=work()
    send(pid,{self(),i})
    end)
    Enum.map(1..5,fn(_) -> respose() end )
  end
  defp respose do
    receive do
       value ->  value

    end

  end
end
Proc.run()|>IO.inspect()
