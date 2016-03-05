require_relative 'cpus'
require_relative 'drive'
require_relative 'motherboard'
require_relative 'computer'
require_relative 'computer_builder'

builder = ComputerBuilder.new
builder.turbo
builder.display(:lcd)
builder.add_cd
builder.add_dvd(true)
builder.add_hard_disk(100_000)

# manufacture 10 computers using the builder
computers = []
10.times { computers << builder.computer.clone }
computers.each { |computer| puts computer }

# computer must have at least 250 MB of memory
builder = ComputerBuilder.new
builder.memory_size(249)
begin
  builder.computer
rescue Exception => e
  puts e.message
end

# computer must have at most 4 drives
builder = ComputerBuilder.new
builder.add_cd
builder.add_dvd
builder.add_hard_disk(1000)
builder.add_cd
builder.add_dvd
begin
  builder.computer
rescue Exception => e
  puts e.message
end

# use magic method to rapidly build a computer
puts 'Computer built with magic method builder'
builder = ComputerBuilder.new
builder.add_cd_and_dvd_and_harddisk_and_turbo
computer = builder.computer
puts "CPU: #{computer.motherboard.cpu.class}"
computer.drives.each { |drive| puts "Drive: #{drive.type}" }
