require_relative 'factory/duck_and_waterlily_factory.rb'
require_relative 'factory/frog_and_algae_factory.rb'

duck_and_waterlily_factory = DuckAndWaterlilyFactory.new(1, 3)

duck_and_waterlily_factory.get_animals.each do |animal|
  animal.eat
end

duck_and_waterlily_factory.get_plants.each do |animal|
  animal.grow
end

frog_and_algae_factory = FrogAndAlgaeFactory.new(4, 2)

frog_and_algae_factory.get_animals.each do |animal|
  animal.eat
end

frog_and_algae_factory.get_plants.each do |animal|
  animal.grow
end
