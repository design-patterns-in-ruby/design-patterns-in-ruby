require './command'
require './composite_command'
require './copy_file'
require './create_file'
require './delete_file'

cmds = CompositeCommand.new
cmds.add_command CreateFile.new('file1.txt', "hello world\n")
cmds.add_command CopyFile.new('file1.txt', 'file2.txt')
cmds.add_command DeleteFile.new('file1.txt')

puts cmds.description
cmds.execute

sleep 1.5
cmds.unexecute
