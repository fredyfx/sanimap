#!/usr/bin/env ruby
#
# Lee un archivo de datos en formato OOo/LibreOffice
# se extrae los valores por cada celda y se procesa
# generando un archivo .CSV (delimitado por comas)
#
# Requisitos: 
# - Archivo se debe convertir a .ods 
# - Nombre de archivo debe ser "todo.ods"
# - Instalar el gem roo.
#
require 'rubygems'
require 'roo'

oo = Openoffice.new("todo.ods")
oo.default_sheet = oo.sheets.first
4.upto(oo.last_row - 3) do |line|
  codigo = oo.cell(line, 'A').to_s
  codigo = codigo[0..codigo.index('.')-1]
  if codigo.length < 6
    codigo = "0" + codigo
  end
  cod_dpto = codigo[0, 2]
  cod_prov = codigo[2, 2]

  distrito = oo.cell(line, 'B')
  distrito = distrito[distrito.index('Dis')..-1]
  riesgo_cisterna = oo.cell(line, 'F')
  riesgo_pozo = oo.cell(line, 'G')
  riesgo_acequia = oo.cell(line, 'H')
  riesgo_vecino = oo.cell(line, 'I')
  riesgo_total = riesgo_cisterna + riesgo_pozo + riesgo_acequia + riesgo_vecino

  if codigo
    puts "#{codigo}, #{cod_dpto}, #{cod_prov}, #{distrito}, #{riesgo_cisterna}, #{riesgo_pozo}, #{riesgo_acequia}, #{riesgo_vecino}, #{riesgo_total}"
  end
end
