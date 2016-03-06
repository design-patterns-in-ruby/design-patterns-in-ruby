require_relative 'parser'

# using parser
puts 'Interpreter patter using a parser'
puts 'Syntax: and(and(bigger 1024) (filename *.lock)) writable'
parser = Parser.new('and (and (bigger 1024) (filename *.lock)) writable')
ast = parser.expression
puts ast.evaluate('.')
puts

# parser-less interpreter
puts 'Interpreter patter without a parser'
puts "Syntax: bigger(1024) & name('*.lock') & writable"
ast = bigger(1024) & name('*.lock') & writable
puts ast.evaluate('.')
