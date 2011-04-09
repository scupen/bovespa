require 'rubygems'
require 'posifile'
module Bovespa
	class Historico< Posifile

		lines_where(0..1,"00") do # header
			set_specification("nome_do_arquivo"=>2..14,"codigo_de_origem"=>15..22,"data_de_geracao_do_arquivo"=>23..30)
		end

		lines_where(0..1,"01") do # Atriutos dos ativos
			set_specification(	"codneg" => 12..23, 
													"data_do_pregao"=>2..9, 
													"coddbi" => 10..11,
													"tpmerc"=>24..26,
													"nomres"=>27..38,
													"especi"=>30..48,
													"prazot"=>49..51,
													"modref"=>52..55,
													"preabre"=>56..68,
													"premax"=>69..81,
													"premin"=>82..94,
													"premed"=>95..107,
													"preult"=>108..120,
													"preofc"=>121..133,
													"preofv"=>134..146,
													"totneg"=>147..151,
													"quatot"=>152..169,
													"voltot"=>170..187,
													"preexe"=>188..200,
													"indopc"=>201..201,
													"datven"=>202..209, # AAAAMMDD
													"fatcot"=>210..126,
													"ptoexe"=>217..229,
													"codisi"=>230..241,
													"dismes"=>242..244
												)
			set_attr_name :codneg
		end
	
		lines_where(0..1,"99") do # trailer
			set_specification("nome_do_arquivo_trailer"=>2..14,"codigo_de_origem_trailer"=>15..22,"data_de_geracao_do_arquivo_trailer"=>23..30,"total_de_registros"=>31..42)
		end

	end
end
