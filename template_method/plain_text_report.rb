require_relative 'report'

class PlainTextReport < Report
  def output_start
  end

  def output_head
    puts "**** #{@title} ****"
    puts
  end

  def output_body_start
  end

  def output_line(line)
    puts line
  end

  def output_body_end
  end

  def output_end
  end
end
