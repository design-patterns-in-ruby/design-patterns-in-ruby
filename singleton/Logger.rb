class Logger
  attr_reader :log

  def initialize
    @log = File.open('log.txt', 'a')
  end

  @@instance = new

  def self.instance
    @@instance
  end

  # def log(msg)
  #   @log.puts(msg)
  # end

  private_class_method :new
end

Logger.instance.log
