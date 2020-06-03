# class Report
#   attr_reader :title, :body

#   def initialize(formatter)
#     @title = 'Hello'
#     @body = ['hello world', 'goodbye world']
#     @formatter = formatter
#   end

#   def print_output
#     @formatter.print_output(self)
#   end
# end

# class Formatter
  # def print_output(context)
  #   raise 'print_output should be implemented'
  # end
# end

# class HtmlFormatter < Formatter
#   def print_output(context)
#     puts '<body>'
#     puts "<h1>#{context.title}</h1>"
#     context.body.each do |line|
#       puts "<p>#{line}</p>"
#     end
#     puts '</body>'
#   end
# end

# class PlainFormatter < Formatter
#   def print_output(context)
#     puts "****#{context.title}****"
#     context.body.each do |line|
#       puts "****#{line}****"
#     end
#   end
# end

# report = Report.new(HtmlFormatter.new)
# report.print_output

# report = Report.new(PlainFormatter.new)
# report.print_output

class Report
  attr_reader :title, :body

  def initialize(&formatter)
    @title = 'Hello'
    @body = ['hello world', 'goodbye world']
    @formatter = formatter
  end

  def print_output
    @formatter.call(self)
  end
end

HTML_FORMATTER = lambda do |report|
  puts '<body>'
  puts "<h1>#{report.title}</h1>"
  report.body.each do |line|
    puts "<p>#{line}</p>"
  end
  puts '</body>'
end

PLAIN_FORMATTER = lambda do |report|
  puts "****#{report.title}****"
  report.body.each do |line|
    puts "****#{line}****"
  end
end

report = Report.new(&HTML_FORMATTER)
report.print_output

report = Report.new(&PLAIN_FORMATTER)
report.print_output
