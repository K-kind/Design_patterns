class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "アヒルの#{@name}は食事中です"
  end

  def sleep
    puts "アヒルの#{@name}は眠っています"
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "スイレンの#{@name}は浮きながら日光を浴びて育ちます。"
  end
end

class Tiger
  def initialize(name)
    @name = name
  end

  def eat
    puts "トラの#{@name}は食べたいものを何でも食べます。"
  end

  def sleep
    puts "トラの#{@name}は眠くなったら眠ります。"
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    puts "樹木の#{@name}が高く育っています。"
  end
end

# class Pond
#   def initialize(animal)
#     @animal = new_animal(animal)
#   end

#   def stimulate_one_day
#     @animal.eat
#     @animal.sleep
#   end
# end

# class Habitat
#   def initialize(animal_class, plant_class)
#     @animal_class = animal_class
#     @plant_class = plant_class
#     @animal = new_organism(:animal, "動物A")
#     @plant = new_organism(:plant, "植物A")
#   end

#   def stimulate_one_day
#     @animal.eat
#     @animal.sleep
#     @plant.grow
#   end

#   def new_organism(type, name)
#     if type == :animal
#       @animal_class.new(name)
#     elsif type == :plant
#       @plant_class.new(name)
#     else
#       raise "Unknown organism type: #{type}"
#     end
#   end
# end

class Habitat
  def initialize(factory)
    @factory = factory
    @animal = @factory.new_animal('動物')
    @plant = @factory.new_plant('植物')
  end

  def stimulate_one_day
    @animal.eat
    @animal.sleep
    @plant.grow
  end
end

# class PondOrganismFactory
#   def new_animal(name)
#     Duck.new(name)
#   end

#   def new_plant(name)
#     WaterLily.new(name)
#   end
# end

class OrganismFactory
  def initialize(animal_class, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class
  end

  def new_animal(name)
    @animal_class.new(name)
  end

  def new_plant(name)
    @plant_class.new(name)
  end
end

# class DuckWaterLilyPond < Pond
#   def new_organism(type, name)
#     if type == :animal
#       @animal_class.new(name)
#     elsif type == :plant
#       @plant_class.new(name)
#     else
#       raise "Unknown organism type: #{type}"
#     end
#   end
# end

# class DuckPond < Pond
#   def new_animal(animal)
#     Duck.new(animal)
#   end
# end

# pond = Pond.new(Duck.new('グーイ'))
# pond = Habitat.new(Duck, WaterLily)
# pond.stimulate_one_day
# jungle = Habitat.new(Tiger, Tree)
# jungle.stimulate_one_day

# pond = Habitat.new(PondOrganismFactory.new, 'グーい', 'あし')
pond_factory = OrganismFactory.new(Duck, WaterLily)
pond = Habitat.new(pond_factory)
pond.stimulate_one_day

jungle_factory = OrganismFactory.new(Tiger, Tree)
pond = Habitat.new(jungle_factory)
pond.stimulate_one_day
