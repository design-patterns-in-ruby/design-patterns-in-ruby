require '../simple_writer'
require './decorator_modules'

w = SimpleWriter.new('out.txt')
w.extend(NumberingWriter)
w.extend(TimeStampingWriter)

w.write_line('hello')
