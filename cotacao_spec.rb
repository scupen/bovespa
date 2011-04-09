require 'rspec'
require 'bovespa'

describe Bovespa::Cotacao do
	it "deve retornar a atributos do papel PETR4" do
		@ativo = Bovespa::Cotacao.new("petr4")
		@ativo.codigo.should eq "#PETR4"
		@ativo.hora.class.should be String
		@ativo.data.class.should be String
		@ativo.oscilacao.class.should be String
		@ativo.valor_ultimo.class.should be String
		@ativo.quant_neg.class.should be String
		@ativo.mercado.class.should be String
		@ativo.descricao.class.should be String
		@ativo.ultimo_valor.class.should be String
		@ativo.ibovespa?.should be true
	end


	it "deve retornar a atributos do papel TELB4" do
		@ativo2 = Bovespa::Cotacao.new("telb4")
		@ativo2.codigo.should eq "TELB4"
		@ativo2.hora.class.should be String
		@ativo2.data.class.should be String
		@ativo2.oscilacao.class.should be String
		@ativo2.valor_ultimo.class.should be String
		@ativo2.quant_neg.class.should be String
		@ativo2.mercado.class.should be String
		@ativo2.descricao.class.should be String
		@ativo2.ultimo_valor.class.should be String
		@ativo2.ibovespa?.should be false
	end
end
