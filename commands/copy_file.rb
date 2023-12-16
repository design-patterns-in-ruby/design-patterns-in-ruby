require 'fileutils'

class CopyFile < Command
  def initialize(source, target)
    super "Copy file: #{source} to #{target}"
    @source = source
    @target = target
  end

  def execute
    @contents = File.read(@target) if File.exist?(@target)
    FileUtils.copy(@source, @target)
  end

  def unexecute
    if @contents
      f = File.open(@target, 'w')
      f.write(@contents)
      f.close
    else
      File.delete(@target)
    end
  end
end
