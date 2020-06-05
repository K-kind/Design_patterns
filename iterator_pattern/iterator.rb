class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

def my_each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

array = ['A', 'B', 'C']
i = ArrayIterator.new(array)
while i.has_next?
  puts i.next_item
end

my_each(array) do |item|
  puts item
end
