# language:pt

@api
@online_challenge
Funcionalidade: api | OnlineChallenge - Validar o endpoint a partir de consulta de veículos
  Como uma aplicação da Webmotors
  Quero chamar o endpoint da consulta de veículos
  Para validar o retorno da chamada com a lista de veículos disponíveis

  @#bruno_nelli
  @$squad_nelli @%consultar_veiculos
  @api_OnlineChallenge_vehicles.get
  Esquema do Cenário: Validar o endpoint OnlineChallenge_version.gets
    Quando chamar o endpoint api_OnlineChallenge_vehicles.get para o cenário "<tipo>"
    Então validar o retorno do endpoint api_OnlineChallenge_vehicles.get de cada vehículo em cada página chamada para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
