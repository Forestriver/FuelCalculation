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
#       |> Float.floor
  end

    # amount of fuel for landing
  def land do
    Start.ship_mass * Start.gravity * 0.033 - 42
              |> Kernel.trunc
  end

    # amount of fuel for launch
  def launch do
    Start.ship_mass * Start.gravity * 0.042 - 33
              |> Kernel.trunc

  end
end
#IO.puts(Start.base_fuel)



defmodule Fuel do
  def add_fuel(ship_mass) when ship_mass <= 0 do
    ship_mass
  end

  def add_fuel(ship_mass) do
    add_mass = ship_mass * Start.gravity * 0.042 - 33
    total = add_mass + ship_mass
    add_fuel(total)
  end
end
IO.puts(Fuel.add_fuel(Start.ship_mass))






#IO.puts("The amount of fuel for launch: " <> Float.to_string(Float.floor(launch)))
#IO.puts("The amount of fuel for landing: " <> Float.to_string(Float.floor(landing)))

#mass = IO.gets("Please provide the mass of the rocket: ")
#gravity = IO.gets("Enter the gravity ratio for the planet of mission start ")
# landing = IO.gets("Please provide the")

#ship_mass = 28801
#gravity = 9.807

#launch = ship_mass * gravity * 0.042 - 33
#landing = ship_mass * gravity * 0.033 - 42

# [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]

#defmodule Varlink do

#  ship_mass = 28801
#  gravity = 9.807
#  def printing do
#    IO.puts(launch)
#  end
#end

#defmodule Tea do
#  def num_input do
#    IO.gets("How many cups? ")
#      |> String.trim
#      |> String.to_integer
#  end
#end
#defmodule TeaPrint do
#  def tea_print do
#    res = Tea.num_input + 12
#    IO.puts(res)
#  end
#end

#TeaPrint.tea_print
