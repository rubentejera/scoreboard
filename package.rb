require File.expand_path(File.dirname(__FILE__) + '/const.rb')

require './trama'

include DataType


class Package

  def initialize(first_byte)
    @data = [first_byte]
  end

  def append_byte(byte)
    @data << byte
  end

  def decode
    # check CRC
    index = 0
    msg = ''

    @data.each do
      byte = @data[index]
      case byte
      when DataTag::RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES
        puts "RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES"

        msg << "RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES = "
        msg << Trama.new(@data[index + 1..index + DataTagOffset::RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES]).to_s
        msg << "\n"

      when DataTag::RELOJ_DE_POSESION
        puts "RELOJ_DE_POSESION"
        msg << "RELOJ_DE_POSESION = "
        msg << Trama.new(@data[index + 1..index + 4]).to_s
        msg << "\n"

      when DataTag::PERIODO
        puts "PERIODO"
        msg << "PERIODO = "
        msg << Trama.new(@data[index + 1..index + 1]).to_s
        msg << "\n"

      when DataTag::PUNTOS_LOCAL
        puts "PUNTOS_LOCAL"
        msg << "PUNTOS_LOCAL = "
        msg << Trama.new(@data[index + 1..index + 3]).to_s
        msg << "\n"

      when DataTag::PUNTOS_VISITANTE
        puts "PUNTOS_VISITANTE"
        msg << "PUNTOS_VISITANTE = "
        msg << Trama.new(@data[index + 1..index + 3]).to_s
        msg << "\n"

      else
        # do something
      end
      index += 1
    end
    return msg
  end

  def to_s
    @data.to_s
  end

end

# TODO OSTIAS! LAS ESTADISTICAS DEL JUGADOR