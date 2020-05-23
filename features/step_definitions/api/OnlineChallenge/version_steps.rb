Dado('ter uma massa configurada a partir dos modelos disponíveis do endpoint api_OnlineChallenge_model.get para o cenário {string}') do |tipo|
  @api_onlinechallenge_model_get_versoes = []
  if tipo.eql?('positivo')
    @api_onlinechallenge_make_get = OnlineChallenge.get('/make')
    @api_onlinechallenge_make_get_marcas = []
    @api_onlinechallenge_make_get.each do |each_make|
      @api_onlinechallenge_make_get_marcas << each_make['ID']
    end
    @api_onlinechallenge_model_get = []
    @api_onlinechallenge_make_get_marcas.each_with_index do |make_id, index|
      query = { 'MakeID' => make_id }
      @api_onlinechallenge_model_get[index] = OnlineChallenge.get('/model', query: query)
    end
    @api_onlinechallenge_model_get.each { |each_model| each_model.each { |each_version| @api_onlinechallenge_model_get_versoes << each_version['ID'] } }
  else
    @api_onlinechallenge_model_get_versoes << generate_suffix_name(rand(1..10))
  end
end

Quando('chamar o endpoint api_OnlineChallenge_version.get para o cenário {string}') do |tipo|
  @api_onlinechallenge_version_get = []
  @api_onlinechallenge_model_get_versoes.each_with_index do |make_id, index|
    query = { 'ModelID' => make_id }
    @api_onlinechallenge_version_get[index] = OnlineChallenge.get('/version', query: query)
    while @api_onlinechallenge_version_get[index].size < 5 && tipo.eql?('positivo') # while necessario devido ao bug em que a api as vezes não retorna 5 resultados
      @api_onlinechallenge_version_get[index] = OnlineChallenge.get('/version', query: query)
    end
  end
end

Então('validar o retorno do endpoint api_OnlineChallenge_version.get de cada versiono de cada marca chamada para o cenário {string}') do |tipo|
  if tipo.eql?('positivo')
    expect(@api_onlinechallenge_model_get.first.code).to eql(api_data_load(%w[http_response_status ok]))
    expect(@api_onlinechallenge_version_get.all? { |each_model| each_model.all? { |each_version| expect(each_version['ModelID']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_version_get.all? { |each_model| each_model.all? { |each_version| expect(each_version['ID']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_version_get.all? { |each_model| each_model.all? { |each_version| expect(each_version['Name']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_version_get.all? { |each_model| api_data_load(%w[versions]).all? { |version| each_model.any? { |each_version| version.eql?(each_version['Name']) } } }).to be_truthy
  else 
    expect(@api_onlinechallenge_version_get.first.code).to eql(api_data_load(%w[http_response_status bad_request]))
    expect(@api_onlinechallenge_version_get.first['Message']).to eql(api_data_load(%w[default_errors messages message_request_invalid]))
    expect(@api_onlinechallenge_version_get.first['MessageDetail']).to eql(api_data_load(%w[default_errors details details_parameter_contains_null_entry_model_id]))
  end
end