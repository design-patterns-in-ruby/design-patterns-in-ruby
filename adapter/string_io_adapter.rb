class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getbyte
    raise EOFError if @position >= @string.length

    ch = @string.getbyte(@position)
    @position += 1
    ch
  end

  def eof?
    @position >= @string.length
  end
end
