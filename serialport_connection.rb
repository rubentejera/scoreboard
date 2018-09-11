require "serialport"

class SerialportConnection
  @seria_port = nil


  def initialize(port_str , baud_rate , data_bits , stop_bits , parity)
    @port_str = port_str
    @baud_rate = baud_rate
    @data_bits = data_bits
    @stop_bits = stop_bits
    @parity = parity
  end


  def connect
    @serial_port = SerialPort.new(@port_str, @baud_rate, @data_bits, @stop_bits, @parity)
  end

  def disconnect
    @serial_port.close
  end


  def is_connected?
    if @serial_port != nil
      return true

    else
      return false
    end
  end


  def get_data
    return @serial_port.gets
  end


end