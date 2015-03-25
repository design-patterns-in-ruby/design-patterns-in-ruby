require 'FileUtils'

class CopyFile < Command
  def initialize(source, target)
    super "Copy file: #{source} to #{target}"
    @source = source
    @target = target
  end

  def execute
    if File.exists?(@target)
      @contents = File.read(@target)
    end
    FileUtils.copy(@source, @target)
  end

  def unexecute
    if @contents
      f = File.open(@target,'w')
      f.write(@contents)
      f.close
    else
      File.delete(@target)
    end
  end
end
