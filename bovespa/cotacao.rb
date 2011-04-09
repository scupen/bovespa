module Bovespa
	class Cotacao

		attr_accessor :raw_attributes

	# more attributes
		def ultimo_valor

		end

		def ibovespa?
		end
		def initialize(nome_do_ativo)
			uri = URI.parse("http://www.bmfbovespa.com.br/cotacoes2000/formCotacoesMobile.asp?codsocemi=petr4")
			res = Net::HTTP.start(uri.host, uri.port) do |http|
				http.get("/cotacoes2000/formCotacoesMobile.asp?codsocemi=petr4")
			end
			xml = Nokogiri::XML(res.body)
			raw_attr = {}
			xml.css("PAPEL").each do |node|
						@raw_attributes = node
			end
			create_attributes
		end

		def create_attributes
			attr_list = ["codigo", "delay", "data", "hora", "oscilacao", "valor_ultimo", "quant_neg", "mercado","descricao"]
			attr_list.each do |method_name|
				self.instance_eval("def #{method_name}; @raw_attributes['#{method_name.upcase}']; end")
			end
		end
	end
end
