require 'rubygems'
require 'cotacao'
require 'rspec'

describe Cotacao do
	it "should be true" do 
		cotacao = Cotacao.new("DemoCotacoesHistoricas12022003.txt")
		cotacao.vale5["codneg"].should eq("VALE5")
	end
end
