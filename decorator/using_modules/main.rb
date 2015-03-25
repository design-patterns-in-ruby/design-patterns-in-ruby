require_relative '../simple_writer'
require_relative 'decorator_modules'

w = SimpleWriter.new('out.txt')
w.extend(NumberingWriter)
w.extend(TimeStampingWriter)

w.write_line('hello')
