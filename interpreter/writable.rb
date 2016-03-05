require_relative 'expression'

class Writable < Expression
  def evaluate(dir)
    results = []
    Dir.entries(dir).each do |e|
      next unless File.file?("#{dir}/#{e}")
      results << e if File.writable?(e)
    end
    results
  end
end
