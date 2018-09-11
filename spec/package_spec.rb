require 'rspec'
require File.expand_path(File.dirname(__FILE__) + '/../package')
require File.expand_path(File.dirname(__FILE__) + '/../const.rb')



describe 'package' do

  def create_package
    package = Package.new(DataType::STX)
    package.append_byte(DataType::KEY)
    package.append_byte(DataType::KEYDATA)
    package.append_byte(DataTag::RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES)
    package.append_byte(0x30)
    package.append_byte(0x30)
    package.append_byte(0x3A)
    package.append_byte(0x30)
    package.append_byte(0x32)
    package.append_byte(0x2E)
    package.append_byte(0x33)
    package.append_byte(0x30)
    package.append_byte(DataTag::RELOJ_DE_POSESION)
    package.append_byte(0x30)
    package.append_byte(0x37)
    package.append_byte(0x2E)
    package.append_byte(0x3F)
    package.append_byte(DataTag::PERIODO)
    package.append_byte(0x32)
    package.append_byte(DataTag::PUNTOS_LOCAL)
    package.append_byte(0x36)
    package.append_byte(0x37)
    package.append_byte(0x3F)
    package.append_byte(DataTag::PUNTOS_VISITANTE)
    package.append_byte(0x38)
    package.append_byte(0x39)
    package.append_byte(0x3F)
    package.append_byte(0xBF)# TODO ESTA MAL DIGIT CONTROL 1
    package.append_byte(0x50)# TODO ESTA MAL DIGIT CONTROL 2
    package.append_byte(DataType::ETX)

    return package
  end


  it 'should return the codification on ASCII chars' do
    package = create_package
    msg=''
    msg << "RELOJ_DE_PARTIDO_CON_DECIMAS_OPCIONALES = 00:02.30\n"
    msg << "RELOJ_DE_POSESION = 07.?\n"
    msg << "PERIODO = 2\n"
    msg << "PUNTOS_LOCAL = 67?\n"
    msg << "PUNTOS_VISITANTE = 89?\n"
    expect(package.decode).to eq(msg)
  end
end