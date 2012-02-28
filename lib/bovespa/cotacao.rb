module Bovespa
	class Cotacao

		def initialize(ativos = nil)
			if ativos.kind_of?(String)
				create_attributes(get_quotes([ativos]).first)
			end
		end

		def get_quotes(ativos)

			uri = URI.parse("http://www.bmfbovespa.com.br")

			res = Net::HTTP.start(uri.host, uri.port) do |http|
				http.get("/Pregao-Online/ExecutaAcaoAjax.asp?CodigoPapel="+ativos.join('|'))
			end

			xml = Nokogiri::XML(res.body)

			result = []

			floats = [:ultimo, :abertura, :minimo, :maximo, :medio, :oscilacao]

			xml.css("Papel").each do |node|
				new_node = {}
				node.each do |key, value|
					new_node.merge!({key.downcase.to_sym => value}) if key.downcase.to_sym == :nome or key.downcase.to_sym == :codigo
					new_node.merge!({key.downcase.to_sym => value.gsub(',','.').to_f}) if floats.include? key.downcase.to_sym
					new_node.merge!({key.downcase.to_sym => DateTime.strptime(value, (value.include?(' ') ? '%d/%m/%Y% H:%M:%S' : '%d/%m/%Y%H:%M:%S'))}) if key.downcase.to_sym == :data
					new_node.merge!({key.downcase.to_sym => false}) if key.downcase.to_sym == :ibovespa
					new_node.merge!({key.downcase.to_sym => true}) if key.downcase.to_sym == :ibovespa and value == "#"
				end
				result << new_node
			end

			result

		end

		def create_attributes(ativo)
			@ativo = ativo
			ativo.each do |key, value|
				self.instance_eval("def #{key}; @ativo['#{key}'.to_sym]; end")
			end
		end

	end
end
