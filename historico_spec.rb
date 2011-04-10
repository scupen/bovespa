require 'rubygems'
require 'bovespa'
require 'rspec'
class MyClass < Bovespa::Historico
end

describe MyClass do
	it "should give information about the header of the file" do
		historico = MyClass.new("DemoCotacoesHistoricas12022003.txt")
		historico.nome_do_arquivo.should eq("COTAHIST.2003")
		historico.codigo_de_origem.should eq("BOVESPA")
		historico.data_de_geracao_do_arquivo.should eq("20040531")
	end

	it "should get the code of the asset" do 
		historico = MyClass.new("DemoCotacoesHistoricas12022003.txt")
		historico.vale5["codneg"].should eq("VALE5")
	end

	it "should return a list of every asset turned into attribute" do	
		historico = MyClass.new("DemoCotacoesHistoricas12022003.txt")
		historico.pos_attributes.length.should be > 478
	end

	it "should have valid specified fields" do
		MyClass.valid_specification?.should be true
	end
end
