# WriterDecorator is an 'abstract' decorators class for SimpleWriter
# it contains generic code that can be overriden by the decorators
require 'forwardable'

class WriterDecorator
  extend Forwardable

  def_instance_delegators :@real_writer, :write_line, :pos, :rewind, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end


# The WriterDecorator class above is equivelent to the class below.
# The 'forwardable' module generates the delegating methods

# class WriterDecorator
#   def initialize(real_writer)
#     @real_writer = real_writer
#   end

#   def write_line(line)
#     @real_writer.write_line(line)
#   end

#   def pos
#     @real_writer.pos
#   end

#   def rewind
#     @real_writer.rewind
#   end

#   def close
#     @real_writer.close
#   end
# end
