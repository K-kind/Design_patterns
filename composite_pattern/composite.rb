class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_required_time
    0
  end

  def total_number_basic_tasks
    1
  end
end

class WarmMilkTask < Task
  def initialize
    super('Warm milk')
  end

  def get_required_time
    10
  end
end

class MixEggTask < Task
  def initialize
    super('Mix egg')
  end

  def get_required_time
    5
  end
end

class Composit < Task
  def initialize(name)
    super(name)
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def delete_task(task)
    @tasks.delete task
  end

  def get_required_time
    @tasks.inject(0) do |tasks, task|
      tasks += task.get_required_time
    end
  end

  def list_tasks
    list = "----#{name}----\n"
    @tasks.inject(list) do |tasks, task|
      tasks += "#{task.name}\n"
    end
  end

  def total_number_basic_tasks
    @tasks.inject(0) do |tasks, task|
      tasks += task.total_number_basic_tasks
    end
  end
end

class MakeBatterComposit < Composit
  def initialize
    super('Make Butter')
    add_task WarmMilkTask.new
    add_task MixEggTask.new
  end
end

make_batter = MakeBatterComposit.new
puts make_batter.get_required_time
puts make_batter.total_number_basic_tasks
puts make_batter.list_tasks
