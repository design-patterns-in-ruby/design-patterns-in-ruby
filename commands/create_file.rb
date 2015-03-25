require 'FileUtils'

class CreateFile < Command
  def initialize(path, contents)
    super "Create file: #{path}" 
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, 'w')
    f.write @contents
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end
