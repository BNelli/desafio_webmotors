Dado('acessar a home') do
  @page = Busca.new
  @page.load
  sleep(60) # sleep necessario devido ao captcha ter que ser resolvido manualmente por ser ambiente produtivos
end

Quando('realizar a busca pelo produto') do
  @page.buscar_por_marca
  @page.filtrar_por_modelo
  @page.filtrar_por_versao
end

Quando('filtrar por uma loja') do
  @page.filtrar_por_loja
  within_window(switch_to_window(windows.last))
  @page.selecionar_estoque_loja
end

Então('validar se os resultados foram apresentados') do
  expect(@page.div_veiculos.text).not_to be_empty
end