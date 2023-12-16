class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def turbo(_has_turbo_cpu = true)
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display(display)
    @computer.display = display
  end

  def memory_size(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writable = false)
    @computer.drives << Drive.new(:cd, 760, writable)
  end

  def add_dvd(writable = false)
    @computer.drives << Drive.new(:dvd, 4700, writable)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end

  def method_missing(name, *args)
    words = name.to_s.split('_')
    return super(name, *args) unless words.shift == 'add'
    words.each do |word|
      next if word == 'and'
      add_cd if word == 'cd'
      add_dvd if word == 'dvd'
      add_hard_disk(100_000) if word == 'harddisk'
      turbo if word == 'turbo'
    end
  end

  def computer
    raise 'Not enough memory.' if @computer.motherboard.memory_size < 250
    raise 'Too many drives.' if @computer.drives.size > 4
    @computer
  end
end
