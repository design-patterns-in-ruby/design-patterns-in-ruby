require_relative 'expression'

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Dir.entries(dir).each do |e|
      next unless File.file?("#{dir}/#{e}")
      base_name = File.basename(e)
      results << e if File.fnmatch(@pattern, base_name)
    end
    results
  end
end
