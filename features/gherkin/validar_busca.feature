# language:pt

@ui
@online_challenge
@#bruno_nelli
@$squad_nelli @%realizar_busca
Funcionalidade: Search - Validar a funcionalidade do campo de busca
  Como usuário webmotors
  Quero selecionar mais opções no campo de busca
  Para especificar a busca aos produtos

  @validar_campos_de_busca
  Cenário: Validar os campos de busca 
    Dado acessar a home
    Quando realizar a busca pelo produto
    Então validar se os resultados foram apresentados

  @validar_estoque_loja
  Cenário: Validar o estoque de uma loja
    Dado acessar a home
    Quando realizar a busca pelo produto
    E filtrar por uma loja
    Então validar se os resultados foram apresentados
