require File.expand_path(File.dirname(__FILE__) + '/const.rb')
require './scoreboard_reader'
require './serialport_connection'
require './package'


serialport = SerialportConnection.new("/dev/ttyUSB0", 9600, 8, 1, SerialPort::NONE)
serialport.connect

while true do
  while (msg = serialport.get_data) do
    package = nil

    msg.each_byte do |data_byte|
      puts data_byte
      case data_byte
      when DataType::STX
        package = Package.new(data_byte)
        puts "*--INICIO PAQUETE--*"

      when DataType::ETX
        puts "*--FIN PAQUETE--*"
        package.append_byte(data_byte)
        puts "Decodificando...."
        package.decode

      else
        package.append_byte(data_byte)
      end
    end
  end
end
serialport.disconnect







