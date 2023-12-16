# Generic virtual proxy

class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    subject.send(name, *args)
  end

  def to_s
    subject.to_s
  end

  def subject
    @subject ||= @creation_block.call
  end
end
