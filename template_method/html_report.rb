require_relative 'report'

class HtmlReport < Report
  def output_title
    puts "<h1>#{@title}</h1>"
  end

  def output_body
    @body.each do |line|
      puts "<p>#{line}</p>"
    end
  end

  def output_body_start
    puts '<body>'
  end

  def output_body_end
    puts '</body>'
  end
end
