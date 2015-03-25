class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getbyte
    if @position >= @string.length
      raise EOFError
    end

    ch = @string.getbyte(@position)
    @position += 1
    return ch
  end

  def eof?
    return @position >= @string.length
  end
end
