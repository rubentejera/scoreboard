class Trama
  def initialize(data)
    @data = data
  end

  def to_s
    msg = ''
    @data.each {|char| msg << char.chr}
    return msg
  end
end