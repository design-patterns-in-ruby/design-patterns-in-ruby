require_relative 'expression'

class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Dir.entries(dir).each do |e|
      next unless File.file?("#{dir}/#{e}")
      results << e if File.size(e) > @size
    end
    results
  end
end
