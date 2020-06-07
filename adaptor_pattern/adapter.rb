class Encriptor
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc
      encrypted_char = key_index % 2 == 1 ? clear_char : @key[key_index]
      writer.putc encrypted_char
      key_index = (key_index + 1) % @key.length
    end
  end
end

encriptor = Encriptor.new("AAAAAA")
reader = File.open("test.txt")
writer = File.open("output.txt", "w")
encriptor.encrypt(reader, writer)
reader.close
writer.close

class StringIoAdapter
  def initialize(clear_string)
    @clear_string = clear_string
    @position = 0
  end

  def getc
    raise EofError if eof?

    clear_char = @clear_string[@position]
    @position += 1
    clear_char
  end

  def eof?
    @position >= @clear_string.length
  end
end

reader = StringIoAdapter.new("BBBBBB")
writer = File.open("output2.txt", "w")
encriptor.encrypt(reader, writer)
writer.close
