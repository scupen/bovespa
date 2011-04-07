require 'test/unit'
require 'cotacao'

class TestCotacao < Test::Unit::TestCase
	def test_cotacao1
		cotacao = Cotacao.new("DemoCotacoesHistoricas12022003.txt")
		assert true
	end
end
