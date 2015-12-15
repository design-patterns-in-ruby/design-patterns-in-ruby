class Decrypter
  def initialize(key)
    @key = key
  end

  def decrypt(reader)
    decrypted_message = ''
    key_index = 0
    until reader.eof?
      encrypted_byte = reader.getbyte
      key_byte = @key.getbyte(key_index)
      decrypted_byte = (encrypted_byte ^ key_byte)
      decrypted_message << decrypted_byte.chr('UTF-8')
      key_index = (key_index + 1) % @key.size
    end
    puts decrypted_message
  end
end
