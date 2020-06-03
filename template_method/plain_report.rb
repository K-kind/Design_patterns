require_relative 'report'

class PlainReport < Report
  def output_title
    puts "****#{@title}****"
  end

  def output_body
    @body.each do |line|
      puts "****#{line}****"
    end
  end
end
