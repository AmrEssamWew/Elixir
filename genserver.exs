defmodule Demo do
  use GenServer

  def start(intial_state) do
    GenServer.start(__MODULE__,intial_state,name: __MODULE__)
  end

  def sqrt(),do: GenServer.cast(__MODULE__,:sqrt)

  def add(num),do: GenServer.cast(__MODULE__,{:add,num})
  def result(),do: GenServer.call(__MODULE__,:result)

def init(initial_State) do
  IO.puts("Server is started with #{initial_State}")
   {:ok,initial_State}
end


def handle_cast(:sqrt, current_State) do
  {:noreply,:math.sqrt(current_State)}
end
def handle_cast({:add,num}, current_State) do
  {:noreply,current_State+num}
end

def handle_call(:result, _, current_State) do
  {:reply,current_State,current_State}
end


end

Demo.start(4)|> IO.inspect()
Demo.sqrt()|> IO.inspect()
Demo.add(10)|> IO.inspect()
Demo.result()|> IO.inspect()
