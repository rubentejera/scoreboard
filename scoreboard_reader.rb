require File.expand_path(File.dirname(__FILE__) + '/const.rb')

require "serialport"
include DataType


class ScoreboardReader

  @serial_port = nil
  PORT_STR = "/dev/ttyUSB0"
  BAUD_RATE = 9600
  DATA_BITS = 8
  STOP_BITS = 1
  PARITY = SerialPort::NONE

  def initialize
    # @sp = SerialPort.new(PORT_STR, BAUD_RATE, DATA_BITS, STOP_BITS, PARITY)
    # conect_to_serial_port
  end

  def connect_to_serial_port
    begin
      @serial_port = SerialPort.new(PORT_STR, BAUD_RATE, DATA_BITS, STOP_BITS, PARITY)
    rescue
      # puts "Error en la conexion"
    ensure

    end
    # @serial_port = SerialPort.new(PORT_STR, BAUD_RATE, DATA_BITS, STOP_BITS, PARITY)
  end

  def is_connected?
    if @serial_port != nil
      return true

    else
      return false
    end
  end

  def get_data
    begin
      # some_code
      # @serial_port = SerialPort.new(PORT_STR, BAUD_RATE, DATA_BITS, STOP_BITS, PARITY)
      return @serial_port.gets
    rescue
      # puts "Error en la conexion"
      return nil
    ensure
      # this_code_is_always_executed
    end
    # @serial_port.gets
  end

  def run
    connect_to_serial_port

    while true do
      while (msg = @serial_port.gets) do
        package = nil

        msg.each_byte do |data_byte|
          puts data_byte
          # case data_byte
          # when DataType::STX
          #   package = Package.new(data_byte)
          #   puts "*--INICIO PAQUETE--*"
          #
          # when DataType::ETX
          #   puts "*--FIN PAQUETE--*"
          #   package.append_byte(data_byte)
          #   puts "Decodificando...."
          #   package.decode
          #
          # else
          #   package.append_byte(data_byte)
          # end
        end
      end
    end
    @serial_port.close
  end

#   private
#
#   class Package
#
#     def initialize(first_byte)
#       @data = [first_byte]
#     end
#
#     def append_byte(byte)
#       @data << byte
#     end
#
#     def decode
#       # check CRC
#       index = 0
#
#       @data.each do
#         byte = @data[index]
#         case byte
#         when DataTag::RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES
#           puts "RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES"
#           puts Trama.new(@data[index + 1..index + 8])
#         when DataTag::RELOJ_DE_POSESION
#           puts "RELOJ_DE_POSESION"
#           puts Trama.new(@data[index + 1..index + 4])
#         when DataTag::PERIODO
#           puts "PERIODO"
#           puts Trama.new(@data[index + 1..index + 1])
#         when DataTag::PUNTOS_LOCAL
#           puts "PUNTOS_LOCAL"
#           puts Trama.new(@data[index + 1..index + 3])
#         when DataTag::PUNTOS_VISITANTE
#           puts "PUNTOS_VISITANTE"
#           puts Trama.new(@data[index + 1..index + 3])
#         else
#           # do something
#         end
#         index += 1
#       end
#     end
#
#     def to_s
#       @data.to_s
#     end
#
#   end
#
#   class Trama
#     def initialize(data)
#       @data = data
#     end
#
#     def to_s
#       msg = ''
#       @data.each {|char| msg << char.chr}
#       msg
#     end
#   end
#
end

# loop = ScoreboardReader.new
# loop.run