require 'forwardable'

class SimpleWriter
  def initialize(path)
    @file = File.open(path, 'w')
  end

  def write_line(text)
    @file.print(text)
    @file.print("\n")
  end

  def rewind
    @file.rewind
  end

  def pos
    @file.pos
  end

  def close
    @file.close
  end
end

class WriteDecorator
  extend Forwardable

  # 第一引数にオブジェクトを参照している属性、第二引数以降に委譲させたいメソッド名を
  def_delegators :@real_writer, :write_line, :rewind, :pos, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end

  # def write_line(text)
  #   @real_writer.write_line(text)
  # end

  # def rewind
  #   @real_writer.rewind
  # end

  # def pos
  #   @real_writer.pos
  # end

  # def close
  #   @real_writer.close
  # end
end

class NumberingWriter < WriteDecorator
  def initialize(real_writer)
    super(real_writer)
    @line = 1
  end

  def write_line(text)
    @real_writer.write_line("#{@line}: #{text}")
    @line += 1
  end
end

class TimeStampWriter < WriteDecorator
  def write_line(text)
    @real_writer.write_line("#{Time.now}: #{text}")
  end
end

module NumberingModule
  # attr_reader :line_number

  def write_line(text)
    @line_number ||= 1
    super("#{@line_number}: #{text}")
    @line_number += 1
  end
end

module TimeStampModule
  def write_line(text)
    super("#{Time.now}: #{text}")
  end
end

# sw = SimpleWriter.new('simple.txt')
# sw.write_line('1行目')
# sw.rewind
# sw.write_line('2行目')
# sw.close

# numbering = NumberingWriter.new(SimpleWriter.new('number.txt'))
# numbering.write_line('AAA')
# numbering.write_line('BBB')
# numbering.close

# number_stamp = TimeStampWriter.new(NumberingWriter.new(SimpleWriter.new('number.txt')))
# number_stamp.write_line('AAA')
# number_stamp.write_line('BBB')
# puts number_stamp.pos
# number_stamp.close

writer = SimpleWriter.new('module.txt')
writer.extend(NumberingModule)
writer.extend(TimeStampModule)
writer.write_line('AAA')
writer.write_line('BBB')
writer.close
