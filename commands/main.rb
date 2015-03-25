require_relative 'command'
require_relative 'composite_command'
require_relative 'copy_file'
require_relative 'create_file'
require_relative 'delete_file'

cmds = CompositeCommand.new
cmds.add_command CreateFile.new('file1.txt', "hello world\n")
cmds.add_command CopyFile.new('file1.txt', 'file2.txt')
cmds.add_command DeleteFile.new('file1.txt')

puts cmds.description
cmds.execute

sleep 1.5
cmds.unexecute
