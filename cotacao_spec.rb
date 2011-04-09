require 'rspec'
require 'bovespa'

describe Bovespa::Cotacao do
	it "deve retornar a cotacao para o papel especificado" do
		@ativo = Bovespa::Cotacao.new("petr4")
		puts @ativo.descricao
		true.should be true
	end

end
