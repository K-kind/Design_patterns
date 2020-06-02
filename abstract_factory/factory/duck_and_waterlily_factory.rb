require_relative 'organism_factory'
require_relative '../animals/duck'
require_relative '../plants/waterlily'

class DuckAndWaterlilyFactory < OrganismFactory
  private

  def new_animal(name)
    Duck.new(name)
  end

  def new_plant(name)
    Waterlily.new(name)
  end
end
