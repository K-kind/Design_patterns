require_relative 'organism_factory'
require_relative '../animals/frog'
require_relative '../plants/algae'

class FrogAndAlgaeFactory < OrganismFactory
  private

  def new_animal(name)
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end
