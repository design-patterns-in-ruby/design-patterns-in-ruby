require 'FileUtils'

class DeleteFile < Command
  def initialize(path)
    super "Delete file: #{path}"
    @path = path
  end
  
  def execute
    if File.exists?(@path)
      @contents = File.read(@path)
    end
    File.delete(@path)
  end

  def unexecute
    if @contents
      f = File.open(@path,'w')
      f.write(@contents)
      f.close
    end
  end
end
