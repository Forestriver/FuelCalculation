# The function accepting user input main parameters
defmodule Start do
  # user input for ship mass
  def ship_mass do
    IO.gets("Enter ship mass: ")
       |> String.trim
       |> String.to_integer
  end

  #user input for planets quantity of the mission
  def planets do
    IO.gets("Please specify the planets quantity for the mission route: ")
        |> String.trim
        |> String.to_integer
  end

 # user input for planets gravity to build the route
  def gravity do
    IO.gets("Enter planet gravity: ")
       |> String.trim
       |> String.to_float
    end
end

defmodule Mass do
  # calculating fuel amount for launch
  # I encountered some problems with passing "gravity" function as second parameter for launch(). I got
  # here the (ArithmeticError) bad argument in arithmetic expression. I got it only with recursion.
  # This launch() func uses the hardcoded float as gravity. As result, the recursion worked well.
  # Additional fuel mass calculated correctly.
  def launch(ship_mass, total) when ship_mass <= 0 do
    total
  end

  def launch(ship_mass, total) do
    add_mass = ship_mass * 9.807 * 0.042 - 33
           |> Float.floor
           |> Kernel.trunc
    launch(add_mass, total + add_mass)
  end

  #calculating the fuel amount for landing. Attempt with tuple as the second parameter for gravity
  #this func works well only without recursion. With recursion I got "== Compilation error in file fuel.ex ==
   # (FunctionClauseError) no function clause matching in Access.get/3, and still didn't solve it.

  def land(ship_mass, total) when ship_mass <= 0 do
    total
  end

  def land(ship_mass, gravity) do
    add_mass = ship_mass * gravity[:land] * 0.033 - 42
           |> Float.floor
           |> Kernel.trunc

    IO.puts(add_mass)
    total = 0
    land(add_mass, total + add_mass)
  end
end

IO.puts(Mass.land(Start.ship_mass, [{:land, 9.807]}))
IO.puts(Mass.launch(Start.ship_mass, 0))
