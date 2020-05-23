# language:pt

@api
@online_challenge
Funcionalidade: api | OnlineChallenge - Validar o endpoint a partir de consulta de modelos veículos
  Como uma aplicação da Webmotors
  Quero chamar o endpoint da consulta de modelos de veículos
  Para validar o retorno da chamada com a lista de modelos disponíveis

  @#bruno_nelli
  @$squad_nelli @%consultar_modelo_veiculos
  @api_OnlineChallenge_model.get
  Esquema do Cenário: Validar o endpoint OnlineChallenge_model.gets
    Dado ter uma massa configurada a partir dos modelos disponíveis do endpoint api_OnlineChallenge_model.get para o cenário "<tipo>"
    Quando chamar o endpoint api_OnlineChallenge_model.get
    Então validar o retorno do endpoint api_OnlineChallenge_model.get de cada modelo de cada marca chamada para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
