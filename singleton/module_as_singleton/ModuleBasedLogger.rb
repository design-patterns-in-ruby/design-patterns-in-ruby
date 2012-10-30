module ModuleBasedLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@level =  WARNING

  # Lazily instantiate @@log
  def self.log
    @@log ||= File.open('log.txt', 'w')
  end

  def self.error(msg)
    log.puts("Error: #{msg}")
    log.flush
  end

  def self.warning(msg)
    log.puts("Warning: #{msg}") if @@level >= WARNING
    log.flush
  end

  def self.info(msg)
    log.puts("Info: #{msg}") if @@level >= INFO
    log.flush
  end

  def self.level=(new_level)
    @@level = new_level
  end

  def self.level
    @@level
  end
end
