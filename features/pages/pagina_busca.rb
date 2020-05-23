class Busca < SitePrism::Page
  set_url ''

  element :input_busca, '#searchBar'
  element :btn_busca, 'div.SearchBar__results__result__name', text: 'Honda', match: :prefer_exact
  element :btn_busca_modelos, 'div.Filters__line--icon--right', text: 'Todos os modelos'
  element :btn_modelo, 'a.Filters__line', text: 'CITY'
  element :btn_busca_versoes, 'div.Filters__line--icon--right', text: 'Todas as versões'
  element :btn_versao, 'a.Filters__line', text: '1.5 EX 16V FLEX 4P'
  element :checkbox_loja, 'label.Checkbox', text: 'Loja'
  element :div_veiculos, 'div.ContainerCardVehicle'
  element :btn_estoque_loja, 'i.CardSeller__stock__seller__arrow'
  elements :vehicle, 'a.CardVehicle__linkPhoto'

  def buscar_por_marca
    input_busca.set('Honda')
    btn_busca.click
  end

  def filtrar_por_modelo
    btn_busca_modelos.click
    btn_modelo.click
  end

  def filtrar_por_versao
    btn_busca_versoes.click
    btn_versao.click
  end

  def filtrar_por_loja
    checkbox_loja.click
    sleep(5) # sleep necessario para carregamento do modal
    vehicle.first.click
  end

  def selecionar_estoque_loja
    btn_estoque_loja.click
    sleep(5) # sleep necessario para carregamento do modal
  end
end
