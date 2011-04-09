require 'rspec'
require 'bovespa'

describe Bovespa::Cotacao do
	it "deve retornar a cotacao para o papel especificado" do
		@ativo = Bovespa::Cotacao.new("petr4")
		puts @ativo.codigo
		puts @ativo.hora
		puts @ativo.data
		puts @ativo.oscilacao
		puts @ativo.valor_ultimo
		puts @ativo.quant_neg
		puts @ativo.mercado
		puts @ativo.descricao
		puts @ativo.ultimo_valor
		puts @ativo.ibovespa?
	end

end
