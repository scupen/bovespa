mGem::Specification.new do |s|
	s.name = 'bovespa'
	s.version = '0.5.4'
	s.summary = 'Biblioteca Ruby para ler arquivos da Série Histórica da Bovespa e obter cotção direto na Bovespa.'
	s.description = 'Biblioteca Ruby para ler arquivos da Série Histórica da Bovespa e obter cotção direto na Bovespa usando o serviço gratuito.'
	s.files = `git ls-files`.split("\n")
	s.homepage = 'http://github.com/marcofognog/bovespa'
  s.platform = Gem::Platform::RUBY
	s.authors = ["Marco Antonio Fogaça Nogueira"]
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7")
	s.add_dependency('nokogiri', '>= 1.4.4', 'posifile', '>=0.2.3')
  s.email = ["marcofognog@gmail.com"]
  s.require_paths = ["lib"]
end
