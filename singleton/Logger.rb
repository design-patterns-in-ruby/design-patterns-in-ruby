class Logger
  attr_reader :log

  def initialize
    @log = File.open('log.txt', 'a')
  end
   
  @@instance = self.new
 
  def self.instance
    return @@instance
  end
 
  # def log(msg)
  #   @log.puts(msg)
  # end
 
  private_class_method :new
end
 
Logger.instance.log
