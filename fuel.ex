# The function accepting user input main parameters
defmodule Start do
  # user input for ship mass
  def ship_mass do
    IO.gets("Enter ship mass: ")
       |> String.trim
       |> String.to_integer
  end
  #user input for planet gravity
  def gravity do
    IO.gets("Enter planet gravity: ")
       |> String.trim
       |> String.to_float
  end
end


defmodule Mass do
  #calculating the fuel amount for landing
  def land(ship_mass, total) when ship_mass <= 0 do
    total
  end
  def land(ship_mass, total) do
    add_mass = ship_mass * 9.807 * 0.033 - 42
           |> Float.floor
           |> Kernel.trunc
    land(add_mass, total + add_mass)
  end

  #calculating fuel amount for launch
  def launch(ship_mass, total) when ship_mass <= 0 do
    total
  end
  def launch(ship_mass, total) do
    add_mass = ship_mass * 9.807 * 0.042 - 33
           |> Float.floor
           |> Kernel.trunc
    launch(add_mass, total + add_mass)
  end
end

IO.puts(Mass.land(Start.ship_mass, 0))
IO.puts(Mass.launch(Start.ship_mass, 0))



#ship_mass = 28801
#gravity = 9.807

#launch = ship_mass * gravity * 0.042 - 33
#landing = ship_mass * gravity * 0.033 - 42

# [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]
