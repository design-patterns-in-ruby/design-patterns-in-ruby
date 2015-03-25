require_relative 'encrypter'
require_relative 'decrypter'
require_relative 'string_io_adapter'

reader = File.open('message.txt')
writer = File.open('message.encrypted','w')
encrypter = Encrypter.new('XYZZY')
encrypter.encrypt(reader, writer)
reader.close
writer.close

reader = StringIOAdapter.new('We attack at dawn')
writer = File.open('out.txt', 'w')
encrypter = Encrypter.new('XYZZY')
encrypter.encrypt(reader, writer)
writer.close

reader = File.open('message.encrypted')
decrypter = Decrypter.new('XYZZY')
decrypter.decrypt(reader)
reader.close
