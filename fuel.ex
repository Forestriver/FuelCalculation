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


defmodule Mass do
  def fuel(ship_mass, total) when ship_mass <= 0 do
    total = total + Start.ship_mass
    IO.puts(total)
  end
  def fuel(ship_mass, total) do
    add_mass = ship_mass * 9.807 * 0.033 - 42
    fuel(add_mass, total + add_mass)

#    IO.puts(total)
    IO.inspect(ship_mass)
  end
end

IO.puts(Mass.fuel(Start.ship_mass, 0))




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
