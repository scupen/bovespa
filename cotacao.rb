require 'rubygems'
require 'posifile'
class Cotacao < Posifile
	lines_where(0..1,"01") do
		set_specification("codneg"=>12..23)
		set_attr_name :codneg
	end
end
