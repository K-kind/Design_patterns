class OrganismFactory
  def initialize(number_animals, number_plants)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("動物 #{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_plant("植物 #{i}")
      @plants << plant
    end
  end

  def get_animals
    @animals
  end

  def get_plants
    @plants
  end
end
