class Report
  def initialize
    @title = 'hello'
    @body = ['hello world', 'goodbye world']
  end

  def print_output
    output_body_start
    output_title
    output_body
    output_body_end
  end

  def output_title
    raise 'output_title should be implemented'
  end

  def output_body
    raise 'output_body should be implemented'
  end

  def output_body_start
  end

  def output_body_end
  end
end
