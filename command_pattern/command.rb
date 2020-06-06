class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end
end

class CreateFile < Command
  def initialize(path, contents)
    super("Create file")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, 'w')
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

class CopyFile < Command
  require 'fileutils'
  def initialize(source, target)
    super("Copy file")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end

  def unexecute
    File.delete(@target)
  end
end

class DeleteFile < Command
  def initialize(path)
    super("Delete file")
    @path = path
  end

  def execute
    if File.exists?(@path)
      @contents = File.read(@path)
    end
    File.delete(@path)
  end

  def unexecute
    f = File.open(@path, 'w')
    f.write(@contents)
    f.close
  end
end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute
    @commands.each do |command|
      command.execute
    end
  end

  def unexecute
    @commands.reverse.each do |command|
      command.unexecute
    end
  end

  def description
    @commands.inject('') { |desc, cmd| desc + "\n#{cmd.description}"}
  end
end

composite = CompositeCommand.new
composite.add_command(CreateFile.new("test.txt", 'This is a test'))
composite.add_command(CopyFile.new('test.txt', 'test_copy.txt'))
composite.add_command(DeleteFile.new('test.txt'))

puts composite.description
composite.execute
composite.unexecute
