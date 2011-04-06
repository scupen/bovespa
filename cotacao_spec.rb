require 'rubygems'
require 'cotacao'
require 'rspec'

describe Cotacao do
	it "should give information about the header of the file" do
		cotacao = Cotacao.new("DemoCotacoesHistoricas12022003.txt")
		cotacao.nome_do_arquivo.should eq("COTAHIST.2003")
		cotacao.codigo_de_origem.should eq("BOVESPA")
		cotacao.data_de_geracao_do_arquivo.should eq("20040531")
	end

	it "should get the code of the asset" do 
		cotacao = Cotacao.new("DemoCotacoesHistoricas12022003.txt")
		cotacao.vale5["codneg"].should eq("VALE5")
	end

	it "should return a list of every asset turned into attribute" do	
		cotacao = Cotacao.new("DemoCotacoesHistoricas12022003.txt")
		cotacao.pos_attributes.length.should be(482)
	end
end
