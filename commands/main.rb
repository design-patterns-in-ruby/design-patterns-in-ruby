require './Command'
require './CompositeCommand'
require './CopyFile'
require './CreateFile'
require './DeleteFile'

cmds = CompositeCommand.new
cmds.add_command CreateFile.new('file1.txt', "hello world\n")
cmds.add_command CopyFile.new('file1.txt', 'file2.txt')
cmds.add_command DeleteFile.new('file1.txt')

puts cmds.description
cmds.execute

sleep 1.5
cmds.unexecute
