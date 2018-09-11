require 'rspec'
require File.expand_path(File.dirname(__FILE__) + '/../trama')


describe 'trama' do
  # it 'should do works fine' do
  #   expect(true).to be_truthy
  #   expect(true).to be true
  # end

  # it 'should be connect' do
  #   serialport = double("serialport", :get_data=> "HOLA")
  #   expect(serialport.get_data).equal?("HOLA")
  # end


  it 'should return the codification on ASCII chars' do
    trama = Trama.new([0x30,0x30,0x3A,0x30,0x32,0x2E,0x33,0x30])
    expect(trama.to_s).to eq("00:02.30")
    expect(trama.to_s).not_to eq("irrelevant")
  end
end