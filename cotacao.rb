require 'rubygems'
require 'posifile'
class Cotacao < Posifile
	lines_where(0..1,"01") do
		set_specification("codneg"=>12..23)
		set_attr_name :codneg
	end
	
	lines_where(0..1,"00") do
		set_specification("nome_do_arquivo"=>2..14,"codigo_de_origem"=>15..22,"data_de_geracao_do_arquivo"=>23..30)
	end
end
