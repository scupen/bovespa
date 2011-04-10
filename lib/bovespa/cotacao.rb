module Bovespa
	class Cotacao

		attr_accessor :raw_attributes

		def initialize(nome_do_ativo)
			uri = URI.parse("http://www.bmfbovespa.com.br/cotacoes2000/formCotacoesMobile.asp?codsocemi="+nome_do_ativo)
			res = Net::HTTP.start(uri.host, uri.port) do |http|
				http.get("/cotacoes2000/formCotacoesMobile.asp?codsocemi="+nome_do_ativo)
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

	# more attributes
		def ultimo_valor
			valor_ultimo
		end

		def ibovespa?
			if @raw_attributes['IBOVESPA'] == 'S'
				return true
			else
				return false
			end
		end
	end
end
