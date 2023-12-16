require_relative 'expression'

class All < Expression
  def evaluate(dir)
    results = []
    Dir.entries(dir).each do |e|
      next unless File.file?("#{dir}/#{e}")
      results << e
    end
    results
  end
end
